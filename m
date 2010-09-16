From: David C Niemi <dniemi@verisign.com>
Subject: Re: Improving High-Load Performance with the Ondemand Governor [PATCH
 ATTACHED]
Date: Thu, 16 Sep 2010 16:39:48 -0400
Message-ID: <4C928094.7080207@verisign.com>
References: <4C88EF04.1030908@verisign.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050209080809020603080905"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4C88EF04.1030908@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

This is a multi-part message in MIME format.
--------------050209080809020603080905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've been doing more testing, and have a couple of observations.  I'm 
attaching a minimal form of my changes as a patch for the latest 
2.6.pre36 git version of the driver.  However, it is difficult for me to 
test under anything other than 2.6.32 (RHEL 6 beta 2), and there are 
some minor differences, though I don't believe they are relevant to my 
results.

It looks like "io_is_busy" set to 1 is quite beneficial for quickly 
reacting the onset of load.

I do see a lot of downshifting from the top speed when a core is at 
"100%" CPU, presumably this means little stalls and lulls, so I expect 
"sampling_down_factor" values greater than 1 continue to be useful and 
the sampling_down_factor continues to be desirable.

I've testing on a dual Xeon X5680 system (other times I've been testing 
on 2-year-old dual Opterons).

I observe about a 10W power consumption reduction at idle between the 
"performance" governor and the "ondemand" governor.  I've seen even 
bigger differences under load, as much as 40 watts, though that could be 
associated with some performance differences.  I haven't tried to 
quantify the effect of the sampling_down_factor tunable on power 
consumption under load, presumably it increases it, but its usage is 
voluntary and that is to be expected.

I have been unable to find a value of up_threshold that does not switch 
frequency on at least one core pretty frequently (ranging a couple of 
times a minute to several times a second).  However, with fairly fast 
sampling intervals (10000 to 50000) I see pretty quick reaction to load 
even with UP_THRESHOLD set high (e.g. 50 or even 95).  So it is likely 
my previous efforts to extend the possible values of UP_THRESHOLD from 
11 to 5 are no longer necessary, and are not included in the attached 
patch.  There are other things I would like to consider doing, however, 
that I'll bring up afterwards, but not in this minimal patch.

David C Niemi

--------------050209080809020603080905
Content-Type: text/x-patch;
 name="cpufreq_ondemand.c-git.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpufreq_ondemand.c-git.patch"

--- cpufreq_ondemand.c-git	2010-09-08 16:02:01.000000000 -0400
+++ cpufreq_ondemand.c-git-dcn	2010-09-16 16:31:27.000000000 -0400
@@ -30,10 +30,12 @@
 
 #define DEF_FREQUENCY_DOWN_DIFFERENTIAL		(10)
 #define DEF_FREQUENCY_UP_THRESHOLD		(80)
+#define DEF_SAMPLING_DOWN_FACTOR		(1)
+#define MAX_SAMPLING_DOWN_FACTOR		(100000)
 #define MICRO_FREQUENCY_DOWN_DIFFERENTIAL	(3)
 #define MICRO_FREQUENCY_UP_THRESHOLD		(95)
 #define MICRO_FREQUENCY_MIN_SAMPLE_RATE		(10000)
-#define MIN_FREQUENCY_UP_THRESHOLD		(11)
+#define MIN_FREQUENCY_UP_THRESHOLD		(5)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)
 
 /*
@@ -82,6 +84,7 @@
 	unsigned int freq_lo;
 	unsigned int freq_lo_jiffies;
 	unsigned int freq_hi_jiffies;
+	unsigned int rate_mult;
 	int cpu;
 	unsigned int sample_type:1;
 	/*
@@ -108,10 +111,12 @@
 	unsigned int up_threshold;
 	unsigned int down_differential;
 	unsigned int ignore_nice;
+	unsigned int sampling_down_factor;
 	unsigned int powersave_bias;
 	unsigned int io_is_busy;
 } dbs_tuners_ins = {
 	.up_threshold = DEF_FREQUENCY_UP_THRESHOLD,
+	.sampling_down_factor = DEF_SAMPLING_DOWN_FACTOR,
 	.down_differential = DEF_FREQUENCY_DOWN_DIFFERENTIAL,
 	.ignore_nice = 0,
 	.powersave_bias = 0,
@@ -259,6 +264,7 @@
 show_one(sampling_rate, sampling_rate);
 show_one(io_is_busy, io_is_busy);
 show_one(up_threshold, up_threshold);
+show_one(sampling_down_factor, sampling_down_factor);
 show_one(ignore_nice_load, ignore_nice);
 show_one(powersave_bias, powersave_bias);
 
@@ -340,6 +346,32 @@
 	return count;
 }
 
+static ssize_t store_sampling_down_factor(struct kobject *a,
+			struct attribute *b, const char *buf, size_t count)
+{
+	unsigned int input, j;
+	int ret;
+	ret = sscanf(buf, "%u", &input);
+
+	mutex_lock(&dbs_mutex);
+	if (ret != 1 || input > MAX_SAMPLING_DOWN_FACTOR || input < 1) {
+		mutex_unlock(&dbs_mutex);
+		return -EINVAL;
+	}
+
+	dbs_tuners_ins.sampling_down_factor = input;
+
+	/* Reset down sampling multiplier in case it was active */
+	for_each_online_cpu(j) {
+		struct cpu_dbs_info_s *dbs_info;
+		dbs_info = &per_cpu(od_cpu_dbs_info, j);
+		dbs_info->rate_mult = 1;
+	}
+	mutex_unlock(&dbs_mutex);
+
+	return count;
+}
+
 static ssize_t store_ignore_nice_load(struct kobject *a, struct attribute *b,
 				      const char *buf, size_t count)
 {
@@ -409,6 +441,7 @@
 	&sampling_rate_min.attr,
 	&sampling_rate.attr,
 	&up_threshold.attr,
+	&sampling_down_factor.attr,
 	&ignore_nice_load.attr,
 	&powersave_bias.attr,
 	&io_is_busy.attr,
@@ -562,6 +595,10 @@
 
 	/* Check for frequency increase */
 	if (max_load_freq > dbs_tuners_ins.up_threshold * policy->cur) {
+		/* If switching to max speed, apply sampling_down_factor */
+		if (policy->cur < policy->max)
+			this_dbs_info->rate_mult =
+				dbs_tuners_ins.sampling_down_factor;
 		dbs_freq_increase(policy, policy->max);
 		return;
 	}
@@ -584,6 +621,9 @@
 				(dbs_tuners_ins.up_threshold -
 				 dbs_tuners_ins.down_differential);
 
+		/* No longer fully busy, reset rate_mult */
+		this_dbs_info->rate_mult = 1;
+
 		if (freq_next < policy->min)
 			freq_next = policy->min;
 
@@ -607,7 +647,8 @@
 	int sample_type = dbs_info->sample_type;
 
 	/* We want all CPUs to do sampling nearly on same jiffy */
-	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
+	int delay = usecs_to_jiffies(dbs_tuners_ins.sampling_rate
+		* dbs_info->rate_mult);
 
 	if (num_online_cpus() > 1)
 		delay -= jiffies % delay;
@@ -711,6 +752,7 @@
 			}
 		}
 		this_dbs_info->cpu = cpu;
+		this_dbs_info->rate_mult = 1;
 		ondemand_powersave_bias_init_cpu(cpu);
 		/*
 		 * Start the timerschedule work, when this governor

--------------050209080809020603080905--

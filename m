From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [Bug 4379] Default sampling rates for ondemand governor are too
 high on a amd64
Date: Wed, 16 Nov 2005 08:50:42 +0100
Message-ID: <437AE4D2.2030503@tremplin-utc.net>
References: <200511152159.jAFLxHL4003020@fire-2.osdl.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020700030304080001070508"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200511152159.jAFLxHL4003020@fire-2.osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: bugme-daemon@bugzilla.kernel.org
Cc: linux@brodo.de, cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------020700030304080001070508
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

15.11.2005 22:59, bugme-daemon@bugzilla.kernel.org wrote/a écrit:
> http://bugzilla.kernel.org/show_bug.cgi?id=4379
> 
> 
> 
> 
> 
> ------- Additional Comments From linux@brodo.de  2005-11-15 13:53 -------
> Is this problem still present in 2.6.14?
> 
I think so.

Well, I've got a patch that should fix it. It make the polling frequency 
10 times faster than it used to be. This is valid _only_ for kernel >= 
2.6.15-rc1 because there is now a check to avoid polling too fast. I've 
tested it here, on my pentium III it works.

Venki, do you see any problem with this patch?

Eric

-- 
From: Eric Piel <eric.piel@tremplin-utc.net>

Make the polling frequency 10 times faster than it used to be, now that 
there is a check to avoid too high freqencies. Solve problems with 
hardwares which have a long transition latency.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
-- 

--------------020700030304080001070508
Content-Type: text/x-patch;
	name="cpufreq-ondemand-more-frequent-polling-2.6.15-rc1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="cpufreq-ondemand-more-frequent-polling-2.6.15-rc1.patch"

--- linux-2.6.14/drivers/cpufreq/cpufreq_ondemand.c.bak	2005-11-16 08:35:14.000000000 +0100
+++ linux-2.6.14/drivers/cpufreq/cpufreq_ondemand.c	2005-11-16 08:36:57.000000000 +0100
@@ -39,7 +39,7 @@
 
 /* 
  * The polling frequency of this governor depends on the capability of 
- * the processor. Default polling frequency is 1000 times the transition
+ * the processor. Default polling frequency is 100 times the transition
  * latency of the processor. The governor will work on any processor with 
  * transition latency <= 10mS, using appropriate sampling 
  * rate.
@@ -53,7 +53,7 @@ static unsigned int 				def_sampling_rat
 #define MIN_STAT_SAMPLING_RATE			(MIN_SAMPLING_RATE_RATIO * jiffies_to_usecs(10))
 #define MIN_SAMPLING_RATE			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
-#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
+#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(100)
 #define DEF_SAMPLING_DOWN_FACTOR		(1)
 #define MAX_SAMPLING_DOWN_FACTOR		(10)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)

--------------020700030304080001070508
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------020700030304080001070508--


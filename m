From: Daniel J Blueman <daniel.blueman@gmail.com>
Subject: [2.6.38-rc7, patch v2] cpuinfo_cur_freq unreadable by non-root
Date: Wed, 2 Mar 2011 17:33:42 +0800
Message-ID: <AANLkTimqGyocbHYZBZzo=S1ep-MA5jtGrsBsGyJ7pw7m@mail.gmail.com>
References: <AANLkTikhgKn9ZCqUXP-K2CtSSTiJ_=tXuhF_t7Rbqgdx@mail.gmail.com>
	<201103020959.31337.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=QBa3ot00287UMMjQw+gC6l74a/GdgNfd94d/Z8ZiVuc=;
        b=X5zJjSkVzf6vd5xkO5KUmkzt8sC6YhGzzl8r7WGLaqzATq7XeH+7WXRoGb/ZxGlMzP
         mIA0D/GF3f3pA3IORW9ZS0j61PH53dj6PXaNBHmAqESnXOd0QUu0fON6rwzXgRNf8qL+
         lM35PIY5dHaexZDu9bFbcs1jkjBmayFrlOdZc=
In-Reply-To: <201103020959.31337.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, linux@dominikbrodowski.net

On 2 March 2011 16:59, Thomas Renninger <trenn@suse.de> wrote:
> On Wednesday, March 02, 2011 06:52:05 AM Daniel J Blueman wrote:
>
>> I failed to find why
>> /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq is only readable
>> by root; the cost of reading it isn't sufficient to cause memory or
>> scheduling denial, but may have been in the past.
>>
>> Thus, allow non-root users read permission, consistent with other
>> attributes, allowing it to be monitored.
>>
>> Signed-off-by: Daniel J Blueman <daniel.blueman@gmail.com>
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 1109f68..0f491fe 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -664,7 +664,7 @@ static ssize_t show_bios_limit(struct
>> cpufreq_policy *policy, char *buf)
>> return sprintf(buf, "%u\n", policy->cpuinfo.max_freq);
>> }
>>
>> -cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
>> +cpufreq_freq_attr_ro(cpuinfo_cur_freq);
>
> Having this read only for root goes back to the beginning
> of git history of this file in 2005...
> It looks like this is done on purpose, but I do not see why
> this should not be readable for others.

> Maybe Dominik or Dave have an idea.
> Please also remove the definition of cpufreq_freq_attr_ro_perm
> in include/linux/cpufreq.h, cpuinfo_cur_freq is the only
> instance using it.

I got a feeling someone would ask. Updated:

/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq is only readable
by root; the cost of reading it isn't sufficient to cause memory or
scheduling denial, but may have been in the past, so allow non-root
users read permission, consistent with other attributes, allowing
monitoring. Remove subsequently unused macro.

Signed-off-by: Daniel J Blueman <daniel.blueman@gmail.com>

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1109f68..0f491fe 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -664,7 +664,7 @@ static ssize_t show_bios_limit(struct
cpufreq_policy *policy, char *buf)
 	return sprintf(buf, "%u\n", policy->cpuinfo.max_freq);
 }

-cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
+cpufreq_freq_attr_ro(cpuinfo_cur_freq);
 cpufreq_freq_attr_ro(cpuinfo_min_freq);
 cpufreq_freq_attr_ro(cpuinfo_max_freq);
 cpufreq_freq_attr_ro(cpuinfo_transition_latency);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index c3e9de8..3a4cdc9 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -277,10 +277,6 @@ struct freq_attr {
 static struct freq_attr _name =			\
 __ATTR(_name, 0444, show_##_name, NULL)

-#define cpufreq_freq_attr_ro_perm(_name, _perm)	\
-static struct freq_attr _name =			\
-__ATTR(_name, _perm, show_##_name, NULL)
-
 #define cpufreq_freq_attr_ro_old(_name)		\
 static struct freq_attr _name##_old =		\
 __ATTR(_name, 0444, show_##_name##_old, NULL)
-- 
Daniel J Blueman

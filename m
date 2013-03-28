From: Parag Warudkar <parag.lkml@gmail.com>
Subject: intel_pstate_timer_func divide by zero oops
Date: Wed, 27 Mar 2013 21:49:13 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1303272103380.8412@gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:x-x-sender:to:cc:subject:message-id:user-agent
         :mime-version:content-type;
        bh=NqlyGCSDyVhQIuMCx+gNIkNOMfTV6gBNEuVwcQY7Xqw=;
        b=08tG/ZE0nUpbP6uJ6RI/LHSgSBdFn6u/aTWsiJTVqIAd1k2tmTdv85fNq/GGHvoW+O
         m5KIIZD1wLe85WWb0inUrQ42HkjbOFP+gHu6fBTMsTdhfKrVMfnskzZIupN6kpt0o3yd
         v+gj5xSxtW6zP1slK26+5wZXT7EG9+CUqpUTOdtwpGD5F9da3aZTtPP8tfxyVnydmQyi
         Eh6hd9KMZTkcDHqExa/Ut2zKvZ8j7qPkVJe1yxE3nyLhP3HwVvYiLdywr3R2V6kLhCfj
         8l+301f4K+0nrJ0BwXfZmZx0fz376+G+SnrSMFAiFXXv2RZdJrGO9aaQHunVV+w2RRGr
         CnZg==
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org

I get this same oops occassionally - the machine freezes and there doesn't 
seem to be any record of the oops on disk.

I captured it on camera - 
https://lh3.googleusercontent.com/-K0lNbJrZBMQ/UVOU1vv1vvI/AAAAAAAANqI/pY92mWm3caE/s800/20130327_205245.jpg

If I am reading this right, it dies on this instruction -

   0xffffffff8145792d <+349>:   divq   0x18(%rcx)

From the lst file that *seems* to be this inline function -

static inline void intel_pstate_calc_busy(struct cpudata *cpu,
                                        struct sample *sample)
{
        u64 core_pct;
        sample->pstate_pct_busy = 100 - div64_u64(
ffffffff8145791d:       48 8b 41 20             mov    0x20(%rcx),%rax
ffffffff81457921:       48 8d 04 80             lea    (%rax,%rax,4),%rax
ffffffff81457925:       48 8d 04 80             lea    (%rax,%rax,4),%rax
ffffffff81457929:       48 c1 e0 02             shl    $0x2,%rax
ffffffff8145792d:       48 f7 71 18             divq   0x18(%rcx)


That  is -
	sample->pstate_pct_busy = 100 - div64_u64(
					sample->idletime_us * 100,
					sample->duration_us);

So looks like sample->duration_us is 0? If so, that implies that 
ktime_us_delta(now, cpu->prev_sample) is zero. I am not entirely sure how 
to handle this case - return if sampling too early, or if there is some 
other bug making the delta calculation go poof.


Thanks,

Parag

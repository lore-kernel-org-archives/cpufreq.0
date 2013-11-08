From: Stratos Karafotis <skarafotis@gmail.com>
Subject: Re: [PATCH] cpufreq: conservative: fix requested_freq reduction issue
Date: Fri, 8 Nov 2013 19:43:28 +0200
Message-ID: <CADmjqpP4dxWoU_3dLzC5+JffvwnZaLV=uxFTghpMRoSL_85TrA@mail.gmail.com>
References: <1383791330-8289-1-git-send-email-chenxg@marvell.com>
	<CAKohpo=2xjR=nr5hyMg9bve5_uVbV79R2FTxks0bLmL7kNV9Mg@mail.gmail.com>
	<CADmjqpNWYVxrXuo106rBuZeZ2BrkGFkmbMJ8jxi39c8kLiQ+iw@mail.gmail.com>
	<CAKohpon6DhiWMuszuznK4ZNCBTpy0_r3gGvTXCDMcktXpN3HEw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=vElY1djm9VMLHrJjI418gu/jsYHmAs4coSHSiSZtPNY=;
        b=cICn1mymLJ1MD6CQdmAjm4ni+0KH1v4dIBEjlRXXTyyF7ufOWeMpN0b5VB1sHbxh+o
         GI/yi75BrafRIkfsj6JjBBkQvo2fnGGxnu/avJge0s38bXPJ2m9wQpLo1PgufRw4gxqr
         H+91L896pk+5BfWczGx7pB1CkZxMifrr1m5CM4rCUbZEe291U0tLZw6+Hfnxsb7wX0dk
         +exYevLdJVjPqTtHwFiq+AIiaDxjVQX26I5nGm8Zmrd5OYVbuTICc3G6R9uqqocWYbAM
         57vLt0VgKuunsy7S9P1Z/LMrg91S4BfAmGCMQvNn69PMeDc18DDRp/rVsF/WjTJwpYrH
         XrEQ==
In-Reply-To: <CAKohpon6DhiWMuszuznK4ZNCBTpy0_r3gGvTXCDMcktXpN3HEw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaoguang Chen <chenxg.marvell@gmail.com>

On Fri, Nov 8, 2013 at 6:55 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 8 November 2013 00:36, Stratos Karafotis <skarafotis@gmail.com> wrote:
>> I think the existing code already checks if the requested_freq is greater
>> than policy->max in __cpufreq_driver_target.
>
> Yes it does. But the problem is:
> - cs_check_cpu() sets requested_freq above policy->max
> - We execute following code because (requested_freq != policy->max)
>
>     dbs_info->requested_freq += get_freq_target(cs_tuners, policy);
>     __cpufreq_driver_target(policy, dbs_info->requested_freq,
> CPUFREQ_RELATION_H);
> - In __cpufreq_driver_target(), we don't do anything and return early..
> - Above will keep on repeating all the time..
>
> If we change the code as I have suggested it to be:
> - After first loop where requested_freq went over policy->max, we will
> return early from cs_check_cpu(), but we have already set freq to max..
>
>> If we put this check earlier, cpufreq will never reach policy->max.
>
> Can you please explain why do you see that happening?

Please let me rephrase my previous post. In some circumstances (depending
on freq_step and freq_table values) CPU frequency will never reach to
policy->max.

For example suppose that (for simplicity values in MHz):
policy->max = 1000
policy->cur = 800
requested_freq = 800
freq_target = 300

In 'first' iteration, if we return early with this code (because
requested_freq will be
1100):
if (dbs_info->requested_freq >= policy->max)
     return;

CPU freq will never go over 800MHz.

I think the current code works correctly.
- The requested freq will go to 1100 in first iteration.
- __cpufreq_driver_target will change CPU freq to 1000
- dbs_cpufreq_notifier will adjust the requested_freq to 1000

In next iteration the code:
if (dbs_info->requested_freq == policy->max)
        return;

will keep the freq to max and break out early.

So, I think there is no need for an extra check because of
dbs_cpufreq_notifier code.


Thanks,
Stratos Karafotis

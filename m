From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: stable 3-10-3: strange output of "lsmod | grep ^acpi_cpufreq"
Date: Mon, 29 Jul 2013 13:21:16 +0530
Message-ID: <CAOh2x=n0-a9amv5cfwOotvCnhNksnNZOSVp4jWk400z71UQeWQ@mail.gmail.com>
References: <51F40612.2050403@gmx.de>
	<2111514.pxW5saG1J3@vostro.rjw.lan>
	<18359786.D7glpto546@vostro.rjw.lan>
	<2368277.VjYrsHUseA@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=BzICYSmkP4Geh2ro5rsSjgSzYVL6L+8shXFPr3USuF8=;
        b=OroJKGTIM3izHw+x1Ku7f6Konl1z5dLnkXFWBbxkL0XqAdi+c7c0rYifAERAdWBAk1
         KRpXcJoLQXU+FJwDrJZystoY2lLVXJh8Gv1djknSTcZn7GjnU9N2OcHdE2E31bctxkLV
         /OkO0j4eQRTSq+oowd0hZByTPF97JyflPRbvvOx8+lqSopqCpTe2g8QO0d9ncOu6nyVN
         Dfj49HuIe7K0Grlzy/YUQovzH4SPB0g8/yY4IckGMlEuayelO2AB+h8JwTM1HQ+9ZonG
         pBp1wF7l/thwhKMBqZ6NqpVQgIr7vOnbViwXtqgp/30tbrxoOYcUhM13LS2Lau5+p/S0
         VVtQ==
In-Reply-To: <2368277.VjYrsHUseA@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Mon, Jul 29, 2013 at 4:50 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> Having a deeper look at it, though, I see that in fact the whole
> cpufreq_cpu_put() is needed if the CPU is not the last one for the given
> policy and is not needed at all otherwise (as described in the changelog
> of the patch below).
>
> Srivatsa, does this make sense to you?

It makes atleast to me :)

> This is not the only bad thing that happens there, however, because
> kobject_put() should only be called for the policy kobject at this
> point if the CPU is not the last one for that policy.
>
> Namely, if the given CPU is the last one for that policy, the
> policy kobject's refcount should be 1 at this point, as set by
> cpufreq_add_dev_interface(), and only needs to be dropped once for
> the kobject to go away.  This actually happens under the cpu == 1
> check, so it need not be done before by cpufreq_cpu_put().

But I see one more issue with this code. For the last cpu we are just
calling kobject_put() and not cpufreq_cpu_put() and hence call to
module_put() is skipped. I am not sure, but that will probably cause
a problem when we try to rmmod the module? But which module then?
As we can't compile cpufreq.c as module.. So, is this part of code junk?
And so can be removed?

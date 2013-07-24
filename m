From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/3 v6] cpufreq: Add debugfs directory for cpufreq
Date: Wed, 24 Jul 2013 11:46:03 +0530
Message-ID: <CAOh2x==uh1y+9h0B0X+VbzDx9UDuNPu7OogwAoGqYwJ3CBg06g@mail.gmail.com>
References: <1374146275-5758-1-git-send-email-cw00.choi@samsung.com>
	<1374146275-5758-2-git-send-email-cw00.choi@samsung.com>
	<CAKohpo=oTsEjzi_51UaZ8ww8UEfZ6hwKAnu9rFgGBkt=TfHi8A@mail.gmail.com>
	<51EF2D06.7000704@samsung.com>
	<51EF70B4.2010806@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=PHzRHeQHXCPYdZ1+RjnBEZlgwoZSNcalngNYAaEqVyE=;
        b=yywWmCtCEmQi48JNGHns0jcaB1yzA1WxxI1X3UhBGJvu1E7vF1BSvDUwZSaCyhAndm
         6mk/MZNKuK7a4fgxo6A1arTwQyblP2eij7ueneuGpuJHwIbCXV2tXRqj6DjXIXX2Uki2
         bamHaubZGci4jratEEbTun+YEyQf3y8PZhaK5fCNk856xlINiUbkDyGGX3VbhAeVPPBe
         Xf7etQPEE+6M/K084DuKlEe/eD+7sDavFMaVWagPHCm0AMWwo8LAXw05r9Rm0MOlimVd
         Vwuu7f4qQf7VWZQ4v83yFum1We0fASk/azjpGBeDqFFn+a0r1l4SJcFAoGipx0SN35xA
         mKaw==
In-Reply-To: <51EF70B4.2010806@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Wed, Jul 24, 2013 at 11:44 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> I considered the parameter type of cpufreq_create_debugfs_symlink() and then
> I need following function declaration because this function didn't always need to
> create symbolic link to policy->cpu. This function declaration is capable of creating
> symbolic link as 'dest_cpu -> src_cpu'
>
>         +static int cpufreq_create_debugfs_symlink(unsigned int src_cpu,
>         +                                          unsigned int dest_cpu)

You need policy structure as well, right? And src_cpu is always going to
be policy->cpu. So you can have policy and cpu as two parameters.. cpu
is dest cpu btw.

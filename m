From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add kernel command line option
 disable intel_pstate.
Date: Fri, 15 Feb 2013 18:58:55 +0530
Message-ID: <CAKohpomECGhRkFp8afS0DvozZFJif3MhGFG5XX2T2RWzC3Ez9w@mail.gmail.com>
References: <6075901.uWCJMxDDFf@vostro.rjw.lan>
	<1360867132-13004-1-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=mH0k8ZB0Qq+q=2bxwHcMUVmj-cy-=N4dBf=6Q2xd6nMw@mail.gmail.com>
	<2881062.pPx9cdkTcn@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2881062.pPx9cdkTcn@vostro.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 15 February 2013 18:00, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Friday, February 15, 2013 09:53:24 AM Viresh Kumar wrote:
>> Parameter to this is really not required. By default intel_pstate
>> driver is enabled, so just past disable_intel_pstate from command line
>> without any args.
>
> Well, quite frankly, I'm fine with both.  It all boils down to passing a
> specific string on the kernel command line.

Well, we are all looking to save worlds power here and my suggestion
would definitely use less power as it has less instructions to execute.
Just for fun!!.

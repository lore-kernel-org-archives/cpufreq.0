From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [REGRESSION] Commit a66b2e50 "Preserve sysfs files across
 suspend/resume" causes a regression in intel_pstate
Date: Thu, 11 Jul 2013 13:11:56 +0530
Message-ID: <CAKohponhQbhdjFAgDCJb9PiU6uQq-9qUydOCeaJJWhAkK9+6Sw@mail.gmail.com>
References: <51DD8890.8040008@gmail.com>
	<51DDDDBB.6070105@linux.vnet.ibm.com>
	<CAOh2x=mK3q339Mnc26VgANTUF1M2zL9pjCsLFbMGbyMWkUmrAQ@mail.gmail.com>
	<51DE5D30.4080905@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51DE5D30.4080905@linux.vnet.ibm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, cpufreq <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, durgadoss.r@intel.com, "Jarzmik, Robert" <robert.jarzmik@intel.com>, tianyu.lan@intel.com

On 11 July 2013 12:52, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:
> Yeah, Tianyu pointed that out to me in the other thread :)
>
> http://marc.info/?l=linux-pm&m=137352402807997&w=2
>
> ... and I almost gave up trying to fix this mess, as I mentioned
> there :-(
>
> If you have any smart solutions in mind to get this right, do
> share your thoughts! :)

Busy currently with Linaro connect and so wasn't able to take
up most of the stuff this week. Would have implement something
similar to what you did.

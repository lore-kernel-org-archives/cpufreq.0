From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2] Cpufreq: Make governor data on nonboot cpus across
 system suspend/resume
Date: Fri, 22 Nov 2013 14:09:15 +0530
Message-ID: <CAKohpok1cXykbuV65v4w3aHyE1qVa2rfmO23m8zsPGchauUXDg@mail.gmail.com>
References: <9847309.KdKOG5y1Zx@vostro.rjw.lan>
	<1384616184-6197-1-git-send-email-tianyu.lan@intel.com>
	<5288425A.6000501@linaro.org>
	<528F0C9E.8020409@linaro.org>
	<528F138B.1090107@intel.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <528F138B.1090107@intel.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lan Tianyu <tianyu.lan@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>

On 22 November 2013 13:49, Lan Tianyu <tianyu.lan@intel.com> wrote:

> I think you also are in the Cc list and replied the mail.:)
> https://lkml.org/lkml/2013/11/21/273

Yeah, my reply was more about the coding style and I should have
asked again on the same mail about waiting for sometime before
posting V3... My fault!!

> I only saw the out-of-tree governor issue your mentioned but where they
> are? How upstream kernel cares them?

That's what I said, we might not care about them. But I had issues with
the design of your patch:

>>> But I don't really like the solution here. You are handling frozen for EXIT in
>>> cpufreq-core and for INIT in governor. That doesn't look like the right
>>> approach.

And so gave the solution I had as well.. And then said, I even don't want my
solution to go in, as this can be fixed by taking adequate steps before
removing non-boot CPUs and we are still in discussions for that.

I will post the short term solution that Rafael referred to as soon as
possible and will discuss more with Rafael about the long term one
(As Rafael pointed out).

Sorry for the confusion..

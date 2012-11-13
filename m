From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [PATCH 3/6 v4] cpufreq: tolerate inexact values when collecting
 stats
Date: Tue, 13 Nov 2012 10:33:49 -0600
Message-ID: <50A2766D.6040008@calxeda.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1352313166-28980-1-git-send-email-mark.langsdorf@calxeda.com> <1352313166-28980-4-git-send-email-mark.langsdorf@calxeda.com> <20121111163821.GA21635@x1.osrc.amd.com> <50A12565.4070701@calxeda.com> <20121113162449.GE9327@x1.osrc.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20121113162449.GE9327@x1.osrc.amd.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Borislav Petkov <bp@alien8.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@gmail.com>

On 11/13/2012 10:24 AM, Borislav Petkov wrote:
> On Mon, Nov 12, 2012 at 10:35:49AM -0600, Mark Langsdorf wrote:
>> The function is buried pretty deep in the cpufreq_stat code. It didn't
>> seem appropriate to make it a function pointer as part of struct
>> cpufreq_driver.
> 
> Right, what's cpufreq-speak for
> 
> 	if (Calxeda)
> 		shift by 10
> 
> ?
> 
> Better yet, add a flag or a bitfield called "minimize_jitter" or similar
> and set it only on your hardware...

Doing it in two passes has a similar effect: systems that have exact
frequencies will get caught in the first pass when the values match. But
adding a flag makes sense.

--Mark Langsdorf
Calxeda, Inc.


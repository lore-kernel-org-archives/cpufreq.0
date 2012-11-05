From: Chris Friesen <chris.friesen@genband.com>
Subject: Re: Fwd: Nice processes prevent frequency increases - possible scheduler
 regression (known good in 2.6.35)
Date: Mon, 05 Nov 2012 08:54:02 -0600
Message-ID: <5097D30A.1030607@genband.com>
References: <CAKKZj2Do+ViFbdmeA9y4qZ4Dd_CrW_wmVWc0_CB4BAAwO6SfJg@mail.gmail.com> <CAKKZj2Av0TN9MbYk=-2ZB_jxDnUCWfrN5tJNZ7azgSHyOrMzvg@mail.gmail.com> <1351942405.16850.23.camel@maggy.simpson.net> <1351943332.16850.25.camel@maggy.simpson.net> <CAKKZj2D-jCkAbEKPX75OFYWrdSYxwh6fFBFy9UBDxy_XHHX3Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKKZj2D-jCkAbEKPX75OFYWrdSYxwh6fFBFy9UBDxy_XHHX3Gg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Zatloukal <myxal.mxl@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On 11/03/2012 09:40 AM, Michal Zatloukal wrote:
> On Sat, Nov 3, 2012 at 12:48 PM, Mike Galbraith<efault@gmx.de>  wrote:
>> On Sat, 2012-11-03 at 04:33 -0700, Mike Galbraith wrote:
>>> On Fri, 2012-11-02 at 21:09 +0100, Michal Zatloukal wrote:

>>> Your nice 19 tasks receiving 'too much' CPU when there are other
>>> runnable tasks around sounds like you have SCHED_AUTOGROUP enabled.
>>
>> (forgot to mention: if that's the case, you can add noautogroup to your
>> kernel command line to turn it off if distro turned it on in .config)
>>
>
> Thanks, Ubuntu's kernel is indeed configured with that option enabled,
> and passing "noautogroup" at grub restores the previous behaviour. I'm
> back to happy days again :) BTW, isn't this the "magic 200-line patch"
> I was reading about ~2 years ago?

Yes.

Chris

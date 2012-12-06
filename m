From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 13:41:07 -0500
Message-ID: <50C0E6C3.4010407@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com> <50C0D64E.8050005@verisign.com> <50C0E30B.2040301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C0E30B.2040301@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Arjan van de Ven <arjan@linux.intel.com>, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/06/12 13:25, Dirk Brandewie wrote:
>
> Without being VERY intimate with scheduler it is not clear how you could get
> here. How can the governor know which core should get the most performance?
>
> When we request a frequency greater than the frequency stamped on the part
> (turbo frequency) the processor opportunistically run at a higher frequency
> upto the requested frequency.
I think being that intimate between the scheduler and the driver is probably not worth the considerable complexity it would introduce.

One bit of general user input I can see being relevant is whether to even consider using power-expensive modes like turbo frequencies at all.  In the first 2 or 3 of Arjan's settings, yes, you would.  In the last two you would never use them.  If you were optimizing for multithreaded performance you might also not want to use them, but perhaps the CPU would be happy to handle that decision for you, as Arjan suggests, so it may not be worth trying to control it top-down.
...
> Keeping an average over time is clearly possible in the driver but it is not clear how it would be useful.  In most situations other that proving that the
> frequency changes over time there is little useful information provided
> by knowing the current operating frequency.
I don't think knowing a precise frequency at a precise time is very critical, but finding something to report would help make users feel the driver is working well.  Having low overhead in collecting the information (like an average speed over a period of time) is more important than its precision or timeliness, as the most common use case is just a GUI feature.

>
> > to just report the max freq that the hardware thread is currently
>> eligible to use?
>>
>
> In Sandybridge you can request any turbo frequency at any time, what frequency
> you actually get is up to the hardware and you can't tell what frequency you actually got.  AFAIK there is no way to tell what you are going to get
> when you request a frequency higher than the frequency stamped on the part.
So if it is not practical to get an average, reporting the frequency stamped on the part is better than nothing.  It is boring, but less boring than reporting "0".
>
> --Dirk
DCN

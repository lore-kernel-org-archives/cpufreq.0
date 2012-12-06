From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 13:35:15 -0800
Message-ID: <50C10F93.3060706@gmail.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com> <50C0D64E.8050005@verisign.com> <50C0E30B.2040301@gmail.com> <50C0E6C3.4010407@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=CSzdx5+VWQCQLp0e896fY9zAdXZZ10lyggWI3Z3ppGY=;
        b=Q5daP/JRc2y3ltqL7mFucyOEfwT3zB1CTi/hy7R7PlTxuvlmL9SSQKBotomT/KqKAA
         +H/UIClmvUvmLaIH5pyW2s3ERCKA0bH+ppBcYdOGi5hwwiKgtgG31k5T9PYzncocmW6T
         UJTB9S0VatFCv7FMND4FW3Ngbo0K1trqSX2lgHmjLuXnGWULg4Aa8f0zLogVRjWT/zjj
         Cb1a8FetLY1VR1UJ6e+9T/XceQ+3fON/Gbbl2b2+lgO9q6WW9LCl/yluJ6epuOI9bjzh
         8QETHOLZsCOCpiH85cZPWD2pR4F7YOYrUGXUnwd9/lSRaX9oLLTBaKgWECLOzBfZa+BJ
         lRTA==
In-Reply-To: <50C0E6C3.4010407@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/06/2012 10:41 AM, David C Niemi wrote:
> On 12/06/12 13:25, Dirk Brandewie wrote:
>>
>> Without being VERY intimate with scheduler it is not clear how you could get
>> here. How can the governor know which core should get the most performance?
>>
>> When we request a frequency greater than the frequency stamped on the part
>> (turbo frequency) the processor opportunistically run at a higher frequency
>> upto the requested frequency.
> I think being that intimate between the scheduler and the driver is probably not worth the considerable complexity it would introduce.
>
> One bit of general user input I can see being relevant is whether to even consider using
>power-expensive modes like turbo frequencies at all.  In the first 2 or 3 of Arjan's settings,
>yes, you would.  In the last two you would never use them.  If you were optimizing for
 >multithreaded performance you might also not want to use them, but perhaps the 
CPU would be
> happy to handle that decision for you, as Arjan suggests, so it may not be worth trying to
> control it top-down.

Yep there are a bunch of ways to skin the cat when it comes to trading peak
performance for saving power.  The driver code is setup allow for having
multiple sets of tuning parameters that could be selected by the
user/system admin/integrator.

The current driver is tuned to have the same or better peak performance
than the ondemand governor while having better power efficiency.

The performance and power efficiency gains depends on the type of workload.

The thorny question in my mind if people agree that having a per architecture p 
state driver is a valid approach is how should the per architecture drivers
be integrated into a system that allows distributions to build generic kernels
with reasonable default behaviour.

> ...
>> Keeping an average over time is clearly possible in the driver but it is not clear how it would be useful.  In most situations other that proving that the
>> frequency changes over time there is little useful information provided
>> by knowing the current operating frequency.
> I don't think knowing a precise frequency at a precise time is very critical, but finding something to report would help make users feel the driver is working well.  Having low overhead in collecting the information (like an average speed over a period of time) is more important than its precision or timeliness, as the most common use case is just a GUI feature.
>

Providing an interface to retrieve the current requested (operating)frequency
is trivial. Giving the user a warm fuzzy that things are changing what this
type of utility is good for IMHO not an unreasonable desire.

The real question is does it need to be reported via the cpufreq subsystem and
if not where should this driver and others like it report the frequency.


>>
>>> to just report the max freq that the hardware thread is currently
>>> eligible to use?
>>>
>>
>> In Sandybridge you can request any turbo frequency at any time, what frequency
>> you actually get is up to the hardware and you can't tell what frequency you actually got.  AFAIK there is no way to tell what you are going to get
>> when you request a frequency higher than the frequency stamped on the part.
> So if it is not practical to get an average, reporting the frequency stamped on the part
>is better than nothing.  It is boring, but less boring than reporting "0".

What would you use this number for in userspace?  I guess I might not
understand exactly what you are asking for here.

--Dirk
>>
>> --Dirk
> DCN
>


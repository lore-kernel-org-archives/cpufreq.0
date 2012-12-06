From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 10:25:15 -0800
Message-ID: <50C0E30B.2040301@gmail.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com> <50C0D64E.8050005@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=0B3mqAJNJX40QW9czs2p/7ydT8Njk66By/VQIoUMPqQ=;
        b=L/sldn12kyvwnp8i4s+qPynI+TcOCN0m12fxoJQ6o4ubssEyA9hYrH01+zr0eV0Zsy
         /cCP+jn4oMF6pdH5iDwdOltJPvF9kOPylq/Uc8DftQ59MfKgDOuKIw1IsHr+iIwIMdwE
         0Q7nbwwtSnFZXaOyEzYnXrNxLdWfZDfYWYBfrP6ONAh6bC5CdBhwFpG+bT6n4dxjDFa+
         c/bzUVsmahvGXFAnV4nbHqyCckkd6jp3LhSO1Yy955PefV123mvVZ47pkHn1XkDiykZE
         a/6eh6W+ZNpGhyhceqDY4ayoAbEzIvKY+qee8WPzHE3b4pAvaUPpd5kRzWcwuDY6kHbm
         74QA==
In-Reply-To: <50C0D64E.8050005@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: Arjan van de Ven <arjan@linux.intel.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/06/2012 09:30 AM, David C Niemi wrote:
> On 12/06/12 11:27, Arjan van de Ven wrote:
>> ...
>>> The exposed configuration interface might be as simple as choosing one of several discrete settings:
>>> - max single-threaded performance
>>> - max multi-threaded performance
>>
>>
>> these are identical on todays silicon btw; or rather, this is not a P state choice item, but a task scheduler policy item.
>
> Here's where there is a difference in power management: if you want to maximize single-thread performance,
 > you're willing to enable power-expensive boost modes on behalf of a thread. 
You don't want to do that for
 > multithreaded performance because your thermal envelope may not let you boost 
them all at once.  Or at
 > least that is what I was thinking.
>

Without being VERY intimate with scheduler it is not clear how you could get
here. How can the governor know which core should get the most performance?

When we request a frequency greater than the frequency stamped on the part
(turbo frequency) the processor opportunistically run at a higher frequency
upto the requested frequency.

> Also some people will be all about I/O throughput, and others will care more about latency than anything else,
 > and percentages for those people may be wildly different than for general 
computation.  So we can't guarantee
 > any particular percentage outside some well-defined benchmarks.  But we could 
try to lump them all together
 > as best we can and have a couple of knobs on the side like the current
 > "io_is_busy", perhaps

io_is_busy is a hint for ondemand to not move to the "idle frequency" while an
I/O is outstanding.   It is not useful if you are not actively managing the 
frequency at idle.


> On reporting frequency: would it be practical to report some sort of medium-term
> average frequency, or if that is not available,

Keeping an average over time is clearly possible in the driver but it is not 
clear how it would be useful.  In most situations other that proving that the
frequency changes over time there is little useful information provided
by knowing the current operating frequency.


 > to just report the max freq that the hardware thread is currently
> eligible to use?
>

In Sandybridge you can request any turbo frequency at any time, what frequency
you actually get is up to the hardware and you can't tell what frequency you 
actually got.  AFAIK there is no way to tell what you are going to get
when you request a frequency higher than the frequency stamped on the part.

--Dirk

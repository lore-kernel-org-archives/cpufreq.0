From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add additional supported CPU ID's
Date: Fri, 17 May 2013 09:08:42 -0700
Message-ID: <5196560A.1070702@gmail.com>
References: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com> <CA+55aFwH08aEe3nJRFobofA9C_J5RnRmBWgMMJZyXTMuhP3j4w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Xz1Od37VyjJhdUOEbIubGeOPOwtyqMKi+/NM6uc+3EA=;
        b=rDtnPYSKFWJ2S+mPW7mbgzRFQfwonaAVgnB57R3bGQkAWN9vYPW8WvKYaCIar0eACh
         CTe4N0RLwt+dQLVzZ15biAAf4EXK/Q3eIIB8xlAFTXLXO0R0GgLWXblZrEMdTt4A/yM4
         YvypYyFSrIs92HXvQvxrgAUWr0UhZH4/X4Pv2WaDvDUbAGYWCc1+Rqj0Nf5yKfzlHqMp
         J/q3Sbg+qRKB5/Cc3wqPrh6cYR9UhVWM+MkFq6x+RmGrIJBZHCzPbxZQhYIrZCce7Rkb
         oUQR1BZ/pG9BY5Bh+M4kTbYUP6IouDXlTkua3ED8OrcVtCGIuSZLVeRihncn6hB6FIJI
         HUTQ==
In-Reply-To: <CA+55aFwH08aEe3nJRFobofA9C_J5RnRmBWgMMJZyXTMuhP3j4w@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: dirk.brandewie@gmail.com, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 05/17/2013 08:47 AM, Linus Torvalds wrote:
> On Fri, May 17, 2013 at 7:38 AM,  <dirk.brandewie@gmail.com> wrote:
>>
>> Add CPU ID's for supported Sandybridge and Ivybrigde processors.
>
> Hmm. Isn't 0x25 "Westmere"?
>

I will update the patch to only include Ivy bridge.  This was a brain fade on my 
part.

> Are the model numbers listed in some doc? I hate this "add random
> numbers (not even in order) without any logic to it".
>

The numbers to marketing name decoding are in system programming manual.
I don't know of a model number to project name list.


> Here's the list we have of family six numbers from
> arch/x86/kernel/cpu/intel.c (used for tlb-flushall crap):
>
>          case 0x60f: /* original 65 nm celeron/pentium/core2/xeon,
> "Merom"/"Conroe" */
>          case 0x616: /* single-core 65 nm celeron/core2solo
> "Merom-L"/"Conroe-L" */
>          case 0x617: /* current 45 nm celeron/core2/xeon "Penryn"/"Wolfdale" */
>          case 0x61d: /* six-core 45 nm xeon "Dunnington" */
>          case 0x61a: /* 45 nm nehalem, "Bloomfield" */
>          case 0x61e: /* 45 nm nehalem, "Lynnfield" */
>          case 0x625: /* 32 nm nehalem, "Clarkdale" */
>          case 0x62c: /* 32 nm nehalem, "Gulftown" */
>          case 0x62e: /* 45 nm nehalem-ex, "Beckton" */
>          case 0x62f: /* 32 nm Xeon E7 */
>          case 0x62a: /* SandyBridge */
>          case 0x62d: /* SandyBridge, "Romely-EP" */
>          case 0x63a: /* Ivybridge */
>
> so it has 0x25 as "Clarkdale" (what's Westmere vs Clarkdale? - Intel
> codenames always seem like a f*cking exercise in trying to confuse
> you). But not SB in any case.
>
> So we used to have the two SB cases listed (2a/2d). Your patch adds
> Clarkdale/Ivybridge (but not in the right order). What about the other
> ones?
>
intel_pstate is intended only for SandyBridge+ CPU's

>                 Linus
>


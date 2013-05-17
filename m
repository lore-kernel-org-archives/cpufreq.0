From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add additional supported CPU ID's
Date: Fri, 17 May 2013 08:47:04 -0700
Message-ID: <CA+55aFwH08aEe3nJRFobofA9C_J5RnRmBWgMMJZyXTMuhP3j4w@mail.gmail.com>
References: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jmhgi7A0LtRZONudEkWkZ8xvdRMRccasgSupYIDBY68=;
        b=Shvv5HQGvEPIZcPDNuWxxUvcduSIO5L6pOqNEFnTsektnpfpILci6mesZOwpC2RGJi
         CnECdlJ2UQYvM5eaSearbEimIsCLPsEHo8U3ajIZMuI4R10g+xtpDHr7xTUe/WXldvEa
         A/1AQFVBsFzWfdXaOr0ZcI/ygbixLbEHJZ8OQXY7XMbXkXD1MofAc+VPh64GCa86tv8q
         1H5JkDIDDkbD/CKNAnqHvWmshEtQ/EFv49IRasQqKSO4/95HJzx8VyfGpOCgOeQuzcq5
         3xc78C5u0TqUb5mElOoSqx4XGERTz6ZbPKExv2yYOrybb/O19p3g/69lWkdTVP3Q3pYt
         cvgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jmhgi7A0LtRZONudEkWkZ8xvdRMRccasgSupYIDBY68=;
        b=R33xOO0t9aSEwTj6flysg5Rehou6tfYullXuO7twJEO2am7e/UrGHYeRWu6/WyFCDi
         xM2FlIfCPoVMQ7xya93PT4tWHzocevWWhUv+pjkRGwceFU9eRK+h5qZzOSou/vFj/9DW
         8g2OM8SkUWoHWG/BEDYVXMQAo1rq3F9zplK+c=
In-Reply-To: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Fri, May 17, 2013 at 7:38 AM,  <dirk.brandewie@gmail.com> wrote:
>
> Add CPU ID's for supported Sandybridge and Ivybrigde processors.

Hmm. Isn't 0x25 "Westmere"?

Are the model numbers listed in some doc? I hate this "add random
numbers (not even in order) without any logic to it".

Here's the list we have of family six numbers from
arch/x86/kernel/cpu/intel.c (used for tlb-flushall crap):

        case 0x60f: /* original 65 nm celeron/pentium/core2/xeon,
"Merom"/"Conroe" */
        case 0x616: /* single-core 65 nm celeron/core2solo
"Merom-L"/"Conroe-L" */
        case 0x617: /* current 45 nm celeron/core2/xeon "Penryn"/"Wolfdale" */
        case 0x61d: /* six-core 45 nm xeon "Dunnington" */
        case 0x61a: /* 45 nm nehalem, "Bloomfield" */
        case 0x61e: /* 45 nm nehalem, "Lynnfield" */
        case 0x625: /* 32 nm nehalem, "Clarkdale" */
        case 0x62c: /* 32 nm nehalem, "Gulftown" */
        case 0x62e: /* 45 nm nehalem-ex, "Beckton" */
        case 0x62f: /* 32 nm Xeon E7 */
        case 0x62a: /* SandyBridge */
        case 0x62d: /* SandyBridge, "Romely-EP" */
        case 0x63a: /* Ivybridge */

so it has 0x25 as "Clarkdale" (what's Westmere vs Clarkdale? - Intel
codenames always seem like a f*cking exercise in trying to confuse
you). But not SB in any case.

So we used to have the two SB cases listed (2a/2d). Your patch adds
Clarkdale/Ivybridge (but not in the right order). What about the other
ones?

               Linus

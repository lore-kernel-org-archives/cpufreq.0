From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: [PATCH] arm64: Fix duplicated Kconfig entries again
Date: Wed, 2 Apr 2014 10:40:20 -0400
Message-ID: <20140402144020.GA20438@zod>
References: <CA+5PVA6awqaSHQboqdv9nynV9Xjp46VeqijDWxZX1v5wDK0NWQ@mail.gmail.com>
 <CAKohpok3gKyOWD0=pSv0yQLNqJcNPNZagRGFXNFHW+3J7E=mOg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=plUGJDNtXn5XHvXxX3FaHv/ICYY0iEF4133sqtBBwnw=;
        b=kPl9Ti1CPt8l3TwUbCqqxyp2H/auvkAs14uI6P6HCxxZnEH9jOJpaAWycNhDjwjeyq
         QiRROVVFHQbjZG36b00VX/DtT1sELTh//OSTJ5zhhSN1KcUXjNKF9/7L3Xo6MzOOGmZ7
         McZOpSnnnLMm6DHMesOE87pUtk+8OVyDbqEboPHLyjlQj99SId6isohNr2u5PIyydnU+
         mlvLUR1GTLGSV/aGOKe08zIOp847pGeL2NEgyaPBBBnmwNlHHw6PCvqIWqH8qWVphSbB
         1Q1Tv3X+UvKzGaKRY1T+G7Eggv4xNYCL6kE5d3caeQ4YUuQMfXb8b61Jv7KIWTBLCJXl
         KcIg==
Content-Disposition: inline
In-Reply-To: <CAKohpok3gKyOWD0=pSv0yQLNqJcNPNZagRGFXNFHW+3J7E=mOg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

Commit 74397174989e5f70 attempted to clean up the power management options
for arm64, but when things were merged it didn't fully take effect.  Fix
it again.

Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
---
 arch/arm64/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 07aa3556952c..8033b9b8a2df 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -321,12 +321,6 @@ menu "CPU Power Management"
 
 source "drivers/cpuidle/Kconfig"
 
-source "drivers/cpufreq/Kconfig"
-
-endmenu
-
-menu "Power management options"
-
 source "kernel/power/Kconfig"
 
 source "drivers/cpufreq/Kconfig"
-- 
1.8.5.3

From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [PATCH 4/9] ia64: cpufreq: move cpufreq driver to drivers/cpufreq
Date: Mon, 1 Apr 2013 14:22:53 -0700
Message-ID: <CA+8MBbLwxiPPvyKyQNEDSbNKthpAmooKVe7b+pg-NCETOkSLPA@mail.gmail.com>
References: <cover.1364229828.git.viresh.kumar@linaro.org>
	<afc636963b63becccf34d092203c53369bd1b735.1364229828.git.viresh.kumar@linaro.org>
	<CAKohponax2iDZeA-WG_L2XVHU5GGJB2nSPWVoVxbZUoez1ZpDw@mail.gmail.com>
	<CAKohpokkyQK+650aPLtdXJ0wHWupR=-bcTM_eCoZRDy3N47HJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=HiUwdpYJtpyAYAuVQ4aWL33MMe5U+4u6oyA0nN9KN4k=;
        b=1Hq/8hncdpdT7pKaeZlUQOQaNe/3E9AlPRspgSRB+hp+BiqB61Zq1xfrPn9ZoTtcIR
         3XJusvKoeqXuFMTf1Wm3xyPbJlqvtHGIeQVG1owGnpA2tVuQXLwjNNSjul817XxD3twi
         3gJR5ABGEDfZMl+oQJKhkfqnK06/RbMKWT+iHckdQWuaoRKMLe6TtqTXkcYRQsvF4Xfn
         jjnKTHtHhW0xNmoHu56W1tVeTaXBUwnMSCyFUPk8Km4ZHGlPT1vGF2PkS2qmNSHNMKOU
         vml1B5SySSgwzxKNUXpDf1tQPLnRyRxmoX+yBMOt7IlV734OwHkN7lbIAo9Z0p5GIOWq
         K1iA==
In-Reply-To: <CAKohpokkyQK+650aPLtdXJ0wHWupR=-bcTM_eCoZRDy3N47HJQ@mail.gmail.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, arvind.chauhan@arm.com, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, cpufreq@vger.kernel.org, Linux PM mailing list <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linaro-kernel@lists.linaro.org, arnd.bergmann@linaro.org, "Rafael J. Wysocki" <rjw@sisk.pl>

[Repost in plain text so the lists don't bounce it - curse you Gmail
for switching to HTML]

> Any comments on this patch?

This part looks OK ... But is there a big finish later in the patch series where
you unify some/all of the cpufreq code across architectures?  By
itself just moving
bits from arch/ia64/kernel/cpufreq to drivers/cpufreq/ doesn't look to add
much value.

-Tony

From: Len Brown <lenb@kernel.org>
Subject: Re: [RFC 0/3] Experimental patchset for CPPC
Date: Fri, 15 Aug 2014 18:11:30 -0400
Message-ID: <CAJvTdKn-NsubOqK9_BOvvmnF9C6cK5tUF22VbWXEaPyXzb0huQ@mail.gmail.com>
References: <1408046230-16439-1-git-send-email-ashwin.chaugule@linaro.org>
	<20140814205143.GY6758@twins.programming.kicks-ass.net>
	<CAJ5Y-ebgJi8Ngxg1X+h7KMundGZPFhYC0hr0Sog6htj=czszgQ@mail.gmail.com>
	<20140815061917.GX19379@twins.programming.kicks-ass.net>
	<CAJ5Y-eaLxCG7dDao00pozXBL2dxPS7tf=xGfaz3O_xfRHtQZnA@mail.gmail.com>
	<53EE0E5B.3050004@linux.intel.com>
	<53EE10CB.7040001@linux.intel.com>
	<CAJ5Y-eZiRyGroems7J2oH05ybbbivM-okm3gFz7Mkuu8ceeCDQ@mail.gmail.com>
	<53EE2BAA.1020603@linux.intel.com>
	<CAJ5Y-eZZz=SrkONt029eZ0AsEZ6xFhW4cmcaEVZ8=8Ls9r5+zA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=SryISl48rEeurVB4Hq3qd8qNX6noZ11lqEtrv2zZ4OQ=;
        b=dIQl2bzqXrG+Xw2MkJAxHQpwksS+7inR7U6ipEvyucaJ5ONyRBIKPRHWawUj6a533e
         SwzmtTLeOKbVh19RdaYczorjaSMe50vVbGvF2XZ9L1nCAUw4ej6cdEP+H7N7y1etywl5
         Ez3ToB3uiEXsDeFU8MtDrTjQzx5ygkMc9nxZqVRET94A48My3VYuJPWdoXWS0nupUlWK
         rATMmsnVeoBYxvNEMYBkx6Zo+gbGbI+uxpkgEJjj/wCf3NKNU6aWp90KiMr+SW/4bl+5
         RshC8IlcNxW5FsVw2dzO8CJlo6l94dKrohr0qR39EEnnT6Dq8EaugpiWE0oBP59kanmL
         1UNQ==
In-Reply-To: <CAJ5Y-eZZz=SrkONt029eZ0AsEZ6xFhW4cmcaEVZ8=8Ls9r5+zA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Cc: Arjan van de Ven <arjan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mike Turquette <mike.turquette@linaro.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Ingo Molnar <mingo@kernel.org>, "Brown, Len" <len.brown@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linaro-acpi@lists.linaro.org" <linaro-acpi@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux acpi <linux-acpi@vger.kernel.org>, cpufreq@vger.kernel.org, Patch Tracking <patches@linaro.org>, Dirk Brandewie <dirk.brandewie@gmail.com>

The Linux team at Intel did not implement ACPI CPPC support
because we see no benefit to it over the native hardware interface on x86.

cheers,
Len Brown
Intel Open Source Technology Center

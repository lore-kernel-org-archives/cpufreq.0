From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH 1/5] acpi-cpufreq: Add support for modern AMD CPUs
Date: Tue, 17 May 2011 19:17:33 +0100
Message-ID: <20110517181733.GA26018@srcf.ucam.org>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
 <20110517173536.GI30053@aftab>
 <20110517174233.GA25111@srcf.ucam.org>
 <20110517181353.GC26422@gere.osrc.amd.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110517181353.GC26422@gere.osrc.amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@amd64.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Andreas Herrmann <andreas.herrmann3@amd.com>

On Tue, May 17, 2011 at 08:13:53PM +0200, Borislav Petkov wrote:

> Right, but I don't think that would be different on Intel and
> static_cpu_has is faster with the alternatives mechanism anyway.

From a neatness perspective it might be reasonable to add it like this 
and then just fix both up in one go, but the same argument applies to 
fixing the intel case first and then applying this patchset. So I'm 
happy enough changing that.

-- 
Matthew Garrett | mjg59@srcf.ucam.org

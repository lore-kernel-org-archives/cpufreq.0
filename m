From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH v4 3/7] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Fri, 22 Jul 2011 15:49:04 +0100
Message-ID: <20110722144904.GA4791@srcf.ucam.org>
References: <1311007062-2050-1-git-send-email-mjg@redhat.com>
 <1311007062-2050-4-git-send-email-mjg@redhat.com>
 <20110722144143.GA26010@aftab>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110722144143.GA26010@aftab>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@amd64.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, "Herrmann3, Andreas" <Andreas.Herrmann3@amd.com>

On Fri, Jul 22, 2011 at 04:41:43PM +0200, Borislav Petkov wrote:

> You need to handle the case where boosting is not even supported by the
> CPU. For example, a Barcelona CPU does not boost but I get
> 
> $ cat /sys/devices/system/cpu/cpu0/cpufreq/boost
> 1

Ah, yeah. Fair enough.

-- 
Matthew Garrett | mjg59@srcf.ucam.org

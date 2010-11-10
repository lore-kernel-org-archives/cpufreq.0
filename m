From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] cpupowerutils: Add basic functions to detect AMD CPB
 information
Date: Thu, 11 Nov 2010 00:23:18 +0100
Message-ID: <20101110232318.GA11763@comet.dominikbrodowski.net>
References: <20101110145627.GA3391@alberich.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101110145627.GA3391@alberich.amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herrmann <herrmann.der.user@googlemail.com>
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Hey,

On Wed, Nov 10, 2010 at 03:56:27PM +0100, Andreas Herrmann wrote:
> To gather boost state information on AMD we need to access CPU
> northbridge PCI functions.
> 
> Thus this change introduces a dependency on libpci (part of pciutils and
> usually installed on Linux systems).

It seems acceptable to me, as long as we don't need to depend on PCI on
non-x86 systems. But it seems to me this got broken already when we added
the MSR read functions?

> Output looks like:
> 
>   # ./utils/cpufreq-info -bAnalyzing Boost Capabilities on CPU 0:

Missing line break?

> +static struct pci_access *pacc;

Do we need to worry about concurrent access?

> +++ b/lib/amdpci.h
> @@ -0,0 +1 @@
> +extern int amd_pci_get_num_boost_states(int *active, int *states);

Do we need a whole file for this one line?

Otherwise, looks really fine and acceptable to me.

Best,
	Dominik

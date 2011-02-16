From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 1/8] libcpupower/cpufreq-info: Add basic functions to
 detect AMD CPB information
Date: Wed, 16 Feb 2011 08:30:09 +0100
Message-ID: <20110216073009.GB27847@comet.dominikbrodowski.net>
References: <cover.1297259254.git.trenn@suse.de>
 <c1f6704f575e250306095c94486c122af646401d.1297259254.git.trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1f6704f575e250306095c94486c122af646401d.1297259254.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: lenb@kernel.org, andreas.herrmann3@amd.com, Andreas Herrmann <herrmann.der.user@googlemail.com>, cpufreq@vger.kernel.org


On Wed, Feb 09, 2011 at 02:56:32PM +0100, Thomas Renninger wrote:
> From: Andreas Herrmann <herrmann.der.user@googlemail.com>
> 
> To gather boost state information on AMD we need to access CPU
> northbridge PCI functions.
> 
> Thus this change introduces a dependency on libpci (part of pciutils and
> usually installed on Linux systems).

Do we need to depend on libpci unconditionally, or can we make this
per-arch?

Best,
	Dominik

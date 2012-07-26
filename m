From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: Disable cpufreq on modern X86 processors
Date: Thu, 26 Jul 2012 06:57:15 -0700
Message-ID: <50114CBB.9060106@linux.intel.com>
References: <201207241515.15324.trenn@suse.de> <20120724132208.GB4609@alberich> <501148A9.8080309@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <501148A9.8080309@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andre Przywara <andre.przywara@amd.com>
Cc: Thomas Renninger <trenn@suse.de>, Andreas Herrmann <andreas.herrmann3@amd.com>, cpufreq@vger.kernel.org, Len Brown <lenb@kernel.org>, Borislav Petkov <borislav.petkov@amd.com>, Michael Galbraith <mgalbraith@suse.de>

On 7/26/2012 6:39 AM, Andre Przywara wrote:
> On Phenoms I could measure much lower power usage with ondemand (or
> conservative) governor on idle. This was not true for Bulldozers
> anymore, so there is some truth in your idea.

for Intel, the very hard split came with Nehalem for real, although
C1E earlier also changed the rules already.

ondemand is 10 years old, and the rules of the hardware have changed
fundamentally twice since.

(and frankly, and this may not be very popular on this list, CPUFREQ is
pretty much beyond fixing. The locking rules are completely hosed, but
more, the assumption that you can or should detangle policy from the
hardware is fundamentally flawed. The policy IS hardware specific.
Because it's tuned for specific hardware behavior, if you actually
optimize it)



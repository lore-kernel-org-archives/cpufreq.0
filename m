From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (3/3) cpufreq_ondemand - 03_sys_freq_step.diff
Date: Mon, 21 Feb 2005 16:26:51 +0100
Message-ID: <20050221152651.GA16387@isilmar.linta.de>
References: <20050220131808.GD4495@inskipp>
	<20050221151750.GB12182@poupinou.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050221151750.GB12182@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>

On Mon, Feb 21, 2005 at 04:17:50PM +0100, Bruno Ducrot wrote:
> On Sun, Feb 20, 2005 at 01:18:08PM +0000, Alexander Clouter wrote:
> > Adds support so that the cpufreq change stepping is no longer fixed at 5% and 
> > can be changed dynamically by the user
> > 
> 
> The cpufreq core will step to the next available frequency (in both
> direction).  So I failed to see the usefullness for this one.

If the load is going down, this tunable defines in what frequency steps the
"target" frequency is decreased -- _then_ the cpufreq core determines which
frequency close to the target is actually supported by the hardware.

Thanks,
	Dominik

From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [BUG] cpufreq on SMP with CPUs present but not online
Date: Tue, 18 Jan 2005 19:06:30 +0100
Message-ID: <20050118180630.GB24734@dominikbrodowski.de>
References: <20050117223827.D31178@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050117223827.D31178@flint.arm.linux.org.uk>
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
To: Russell King <rmk@arm.linux.org.uk>
Cc: cpufreq@zenII.linux.org.uk

On Mon, Jan 17, 2005 at 10:38:27PM +0000, Russell King wrote:
> ... causes the cpufreq driver init method to be called for each CPU.
> However, this causes something of a dilema on ARM/SMP - if the CPU
> is not online (because we failed to bring it up via __cpu_up which
> correctly returned an error), we can't read the current clock rate
> settings, so we can't initialise policy->{cur,min,max} fields.

Do I understand you correctly that this CPU will be brought up later?

> Returning an error from the cpufreq driver init method means that
> cpufreq completely forgets about this particular CPU, which also
> isn't desirable.
> 
> Ideas?

Yes. I had tried to integrate cpufreq better with the CPU hotplug core a few
months ago, but got delayed because of other hotplug-related issues which
hopefully will be sorted out very soon. Stay tuned.

	Dominik

PS: should we all use cpufreq@zenII.linux.org.uk or @lists.linux.org.uk?

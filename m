From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: CPU Frequency Warnings
Date: Sun, 21 Nov 2004 11:09:01 +0100
Message-ID: <20041121100901.GC14594@dominikbrodowski.de>
References: <1100739388.3882.39.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1100739388.3882.39.camel@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Donnie Barnes <djb@donniebarnes.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 17, 2004 at 07:56:28PM -0500, Donnie Barnes wrote:
> 
> Just installed FC3 with kernel 2.6.9-1.678_FC3 and am getting this:
> 
> Nov 17 20:54:34 localhost kernel: Warning: CPU frequency is 997000,
> cpufreq assumed 731000 kHz.
> 
> It's on a Via Epia MII 10000 mini-itx motherboard with onboard CPU.
> Any fix for this?  Found a reference from the FC2 days to report it to
> this address.

Something (probably the BIOS) changed the CPU speed in between
initialization of the CPU and this message (did you suspend to disk / ram in
between?). It's not really problematic unless you run a ntp server on this
system or other time- and timing-critical applications. Also, the kernel did
manage the situation then, so from this message on all things should be in
order again, unless something changed the CPU speed behind the kernel's back
again.

	Dominik

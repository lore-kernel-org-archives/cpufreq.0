From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Speedstep on Intel Pentium M
Date: Wed, 2 Jun 2004 14:43:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602124345.GC9210@dominikbrodowski.de>
References: <8012937.1086037545966.SLOX.WebMail.wwwrun@thor.yiti.intern>
	<20040531233542.368b9da0.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040531233542.368b9da0.frx@firenze.linux.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk

On Mon, May 31, 2004 at 11:35:42PM +0200, Francesco Poli wrote:
> On Mon, 31 May 2004 23:05:45 +0200 (CEST) Frank Doege wrote:
> 
> > i have sucessfully enabled speedfreq using the centrino drivers in the
> > kernel 2.6.7. My Laptop steps between 600Mhz and 1.2 Ghz, all runs
> > very fine. The Question i have is why can windows step the processor
> > to 300Mhz but Linux doesnt ?
> 
> As I understand it, Windows throttles the CPU in order to reach that
> `virtual' 300 MHz clock frequency.
> But throttling is useless, at least from an energy-saving point of view.
> It could be useful from a thermal point of view, but, IIRC, ACPI
> P-states should be better for that.
> 
> Cpufreq gurus and kernel hackers are welcome to correct me and/or
> clarify further...  :p

All you said is correct :-) Throttling only makes sense, from an
energy-saving point of view, if P-States == frequency and voltage scaling do
not provide enough cooling to avoid having to start the CPU fan.

	Dominik

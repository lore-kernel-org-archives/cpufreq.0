From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8, more updates
Date: Thu, 18 Mar 2004 23:33:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040318223337.GA1532@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C1126A014@txexmtae.amd.com>
	<20040317100745.GA15284@dominikbrodowski.de>
	<20040317120409.GA482@elf.ucw.cz>
	<20040317124432.GA7426@dominikbrodowski.de>
	<20040317195015.GA287@elf.ucw.cz>
	<20040317202541.GA7101@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040317202541.GA7101@dominikbrodowski.de>
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
To: paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

> > > can we change this to dprintk, please? It avoids some noise....
> > 
> > I agree about the second one. I thought that list of frequencies in
> > MHz is probably important enough?
> 
> Well, you can get this easily enough in
> /sys/devices/system/cpu/cpu?/scaling_available_frequencies,
> so I'd say no -- but it's a close call.

Okay, I guess it does not really matter.
							Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]

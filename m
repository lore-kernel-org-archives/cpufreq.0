From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 18:37:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209173710.GD13262@poupinou.org>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
	<20040209152052.GA13262@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209152052.GA13262@poupinou.org>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Mon, Feb 09, 2004 at 04:20:52PM +0100, Bruno Ducrot wrote:

> > How about
> > 	if (p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
> 
> because I use p.control_register at least 2 times, and when that happens
> I prefer to introduce another variable, because it's more easier to read IMHO.

Actually, what I wrotte is stupid in that case, and that obfuscate more.
I will do what you suggest.


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

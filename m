From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Fri, 4 Jun 2004 11:59:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040604095945.GI13782@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
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
To: paul.devriendt@amd.com
Cc: davej@redhat.com, Cpufreq@www.linux.org.uk

On Thu, Jun 03, 2004 at 04:42:22PM -0500, paul.devriendt@amd.com wrote:
> 
> > We could kludge around this by doing a compare of the tables before we
> > abort, and if they are the same, just ignore one of them.
> > If it differs, we do what we do now.
> > 
> > Ideally, this should be fixed in a BIOS update though, or 
> > alternatively
> > an ACPI fallback.
> > 
> > Paul ?
> > 
> > 	Dave
> 
> I'm willing to put it in the driver. It is easy to ignore certain
> table entries (thanks Dominik!), and I already have to do so for
> the case where BIOSs are filling out unused entries with -1 instead
> of accurately reporting how many entries actually exist.

What about doing this kludge in drivers/acpi/processor.c in 
acpi_processor_get_performance_states() so that all
drivers will benefit for this?

Dominik?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

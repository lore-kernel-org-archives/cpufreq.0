From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: Mon, 23 Jun 2003 18:11:36 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030623161136.GG19556@poupinou.org>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com> <20030623133834.GA2330@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030623133834.GA2330@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: "Grover, Andrew" <andrew.grover@intel.com>, David Moore <dcm@acm.org>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq@www.linux.org.uk

On Mon, Jun 23, 2003 at 03:38:34PM +0200, Dominik Brodowski wrote:
> On Mon, Jun 23, 2003 at 02:19:27AM -0700, Grover, Andrew wrote:
> > The spec intended FixedFunctionalHW registers to be an "escape hatch".
> > FFH means that while ACPI is used for perf state enumeration, the
> > transitions will be handled in a CPU-specific driver, not via methods
> > described in the ACPI spec. This division (use ACPI for enum, x for
> > control) isn't currently supported by cpufreq; ACPI either does both
> > enum and control, or neither.
> 
> But it could easily be added to the cpufreq drivers. For example, the
> speedstep-centrino driver could call a 
> 
> int acpi_get_frequency_table(struct cpufreq_frequency_table **freq_table)
> 
> which returns an array with the frequency in freq_table[i].frequency, and
> some sort of "index" in freq_table[i].index, e.g. what needs to be written
> into the IA32_PERF_CTL MSR.
> 

Yes.  It can be added.  But do we want to add it?  That's the real
question.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

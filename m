From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [powernow-k8] some wrong frequencies on opterons 252,
	howto find them?
Date: Mon, 28 Nov 2005 16:13:44 +0100
Message-ID: <20051128151344.GC25063@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84303218986@SAUSEXMB1.amd.com>
	<20051128093409.GB25063@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051128093409.GB25063@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Nov 28, 2005 at 10:34:09AM +0100, Bruno Ducrot wrote:
> On Sat, Nov 26, 2005 at 07:55:22PM -0600, Langsdorf, Mark wrote:
> > 
> > > At work we have some HP DL385 with those processors:
> > > 
> > > # cat /proc/cpuinfo
> > > processor       : 0
> > > vendor_id       : AuthenticAMD
> > > cpu family      : 15
> > > model           : 37
> > > model name      : AMD Opteron(tm) Processor 252
> > 
> > > 
> > > Unfortunately, I got that:
> > > 
> > > powernow-k8: Found 2 AMD Athlon 64 / Opteron processors 
> > > (version 1.50.4)
> > > powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> > > powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> > > powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> > > powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> > > powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
> > > cpu_init done, current fid 0x12, vid 0x6
> > > powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
> > > powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
> > > powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
> > > powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
> > > powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
> > > cpu_init done, current fid 0x12, vid 0x6
> > > 
> > > The low frequency is missing.  I think the correct one is
> > > 1000 MHz, 1100 mV, but I don't find exactly the correct spec 
> > > under "AMD Opteron Processor Power and Thermal Data Sheet", 
> > > even though I'm pretty sure it is the one at page 33.
> > > 
> > > Someone from AMD people that could validate this, please?
> > 
> > Funky.  It could be that the driver is misparsin the ACPI
> > objects, though I doubt that.  It could be that HP didn't
> > put the low frequency _PSS object in the BIOS.  Can you
> > give me the BIOS version so I can try to set up a system?
> > Thanks.
> > 
> 
> BIOS is A05.  There is no related ACPI objects, therefore
> the powernow configuration stuff is done by the legacy BIOS
> PSB/PST tables.
> 

In fact I'm wrong.  The ACPI processor objects are stored under
some memory region, and are loaded via something like this:

        Method (_INI, 0, NotSerialized)
        {
            Name (HAN0, 0x00)
            Name (HAN1, 0x00)
            Name (HAN2, 0x00)
            Name (HAN3, 0x00)
            OperationRegion (IST0, SystemMemory, SSD0, SSL0)
            OperationRegion (IST1, SystemMemory, SSD1, SSL1)
            OperationRegion (IST2, SystemMemory, SSD2, SSL2)
            OperationRegion (IST3, SystemMemory, SSD3, SSL3)
            If (LEqual (PNEN, 0x00))
            {
                If (LEqual (TBL0, 0x00))
                {
                    If (P0IN)
                    {
                        Load (IST0, HAN0)
                        Store (0x01, TBL0)
                    }
                }
		... (more If() statements with Load stuff inside, I
		guess the IST? thing is named from Intel speedstep stuff
		somehow,?)



Note the Load statement.  I could eventually dump those regions and
disassemble them, but I'm not sure you want those results.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

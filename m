From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [powernow-k8] some wrong frequencies on opterons 252,
	howto find them?
Date: Mon, 28 Nov 2005 17:19:49 +0100
Message-ID: <20051128161949.GD25063@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A8430321898A@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8430321898A@SAUSEXMB1.amd.com>
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

On Mon, Nov 28, 2005 at 09:20:48AM -0600, Langsdorf, Mark wrote:
> > > > Funky.  It could be that the driver is misparsin the ACPI 
> > > > objects, though I doubt that.  It could be that HP didn't
> > > > put the low frequency _PSS object in the BIOS.  Can you
> > > > give me the BIOS version so I can try to set up a system? 
> > > 
> > > BIOS is A05.  There is no related ACPI objects, therefore
> > > the powernow configuration stuff is done by the legacy BIOS PSB/PST 
> > > tables.
> > > 
> > 
> > In fact I'm wrong.  The ACPI processor objects are stored 
> > under some memory region, and are loaded via something like this:
> 
> That's a relief.  I thought something seriously weird was
> happening.
> 
> >         Method (_INI, 0, NotSerialized)
> >         {
> >             Name (HAN0, 0x00)
> >             Name (HAN1, 0x00)
> >             Name (HAN2, 0x00)
> >             Name (HAN3, 0x00)
> >             OperationRegion (IST0, SystemMemory, SSD0, SSL0)
> >             OperationRegion (IST1, SystemMemory, SSD1, SSL1)
> >             OperationRegion (IST2, SystemMemory, SSD2, SSL2)
> >             OperationRegion (IST3, SystemMemory, SSD3, SSL3)
> >             If (LEqual (PNEN, 0x00))
> >             {
> >                 If (LEqual (TBL0, 0x00))
> >                 {
> >                     If (P0IN)
> >                     {
> >                         Load (IST0, HAN0)
> >                         Store (0x01, TBL0)
> >                     }
> >                 }
> > 		... (more If() statements with Load stuff inside, I
> > 		guess the IST? thing is named from Intel speedstep stuff
> > 		somehow,?)
> > 
> > 
> > 
> > Note the Load statement.  I could eventually dump those 
> > regions and disassemble them, but I'm not sure you want
> > those results.
> 
> No, that's okay.  If you could retrieve the value of
> pr->performance->state_count from line 1011 of
> drivers/acpi/processor.c, and the values of 
> px->control from line 1036 of the same file for each
> _PSS object, that would be very helpful.
> 

Ok.

The dmesg look like that now:

powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.50.4)
processor id 0: pr->performance->state_count 5
processor id 0: State [0]: core_frequency[2600] power[68000] transition_latency[100] bus_master_latency[7] control[0xc0701192] status[0x192]
processor id 0: State [1]: core_frequency[2400] power[65400] transition_latency[100] bus_master_latency[7] control[0xc0701210] status[0x210]
processor id 0: State [2]: core_frequency[2200] power[55500] transition_latency[100] bus_master_latency[7] control[0xc070128e] status[0x28e]
processor id 0: State [3]: core_frequency[2000] power[47000] transition_latency[100] bus_master_latency[7] control[0xc070130c] status[0x30c]
processor id 0: State [4]: core_frequency[1800] power[39600] transition_latency[100] bus_master_latency[7] control[0xc070138a] status[0x38a]
data->acpi_data.state_count: 5
data->numps 5
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
cpu_init done, current fid 0x12, vid 0x6
processor id 1: pr->performance->state_count 5
processor id 1: State [0]: core_frequency[2600] power[68000] transition_latency[100] bus_master_latency[7] control[0xc0701192] status[0x192]
processor id 1: State [1]: core_frequency[2400] power[65400] transition_latency[100] bus_master_latency[7] control[0xc0701210] status[0x210]
processor id 1: State [2]: core_frequency[2200] power[55500] transition_latency[100] bus_master_latency[7] control[0xc070128e] status[0x28e]
processor id 1: State [3]: core_frequency[2000] power[47000] transition_latency[100] bus_master_latency[7] control[0xc070130c] status[0x30c]
processor id 1: State [4]: core_frequency[1800] power[39600] transition_latency[100] bus_master_latency[7] control[0xc070138a] status[0x38a]
data->acpi_data.state_count: 5
data->numps 5
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xa (1300 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xc (1250 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0xe (1200 mV)
cpu_init done, current fid 0x12, vid 0x6


For the record, I put the SSDTs loaded via the Load stuff
found after dumping the memory regions as I said earlier.
I don't think you will need them though.  There is no low
frequency for sure.

ftp://ftp.poupinou.org/cpufreq/DL385/HP385.ssdt.tar.gz

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Call4Response: Correct PST table for ATHLONs
Date: Wed, 2 Jul 2003 16:51:00 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030702145100.GQ7796@poupinou.org>
References: <3F028F2C.5020704@searchbroker.de> <20030702140206.GP7796@poupinou.org> <3F02EF52.4080908@searchbroker.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F02EF52.4080908@searchbroker.de>
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
To: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 02, 2003 at 04:42:26PM +0200, Lars Gemeinhardt wrote:
> Ducrot Bruno wrote:
> 
> >On Wed, Jul 02, 2003 at 09:52:12AM +0200, Lars Gemeinhardt wrote:
> > 
> >
> >>Hello cpufreq-user and developer,
> >>
> >>can everybody with an correct PST table (diffent FIDs and VIDs) and an 
> >>ATHLON cpu post the "dmesg" snip (you get this using the dmesg command 
> >>after the modul is loaded) to this mailing-list...
> >>Maybe we can setup with this the correct values to the cpufreq driver 
> >>(the K7 powernow part)...then otherwise the Acer and Sony notebooks 
> >>doesn't work perfectly :-(
> >>
> >>   
> >>
> >
> >
> >You may want perhaps to get x86info instead.
> >
> >Just do something like that:
> >
> >cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/x86info co 
> >x86info
> >
> >then edit AMD/dumppsb.c
> >at a line which look like
> >
> >if ((etuple(cpu) == pst->cpuid) && (maxfid==pst->maxfid) && 
> >(startvid==pst->startvid))
> >
> >replace with
> >if (1)
> >
> >Then all PST tables should be dumped for different cpuid.
> >
> >
> > 
> >
> I think this is not what I expect ... I tested x86info and here is my 
> output-snip:
> 
> FID changes will happen
> VID changes will happen
> Current VID multiplier code: 1.300
> Current FSB multiplier code: 13.0
> Voltage ID codes: Maximum=1.300V Startup=1.300V Currently=1.300V
> Frequency ID codes: Maximum=13.0x Startup=5.0x Currently=13.0x
> Decoding BIOS PST tables (maxfid=14, startvid=e)
> Found PSB header at 0x4018f4e0
> Table version: 0x12
> Flags: 0x0 (Mobile voltage regulator)
> Settling Time: 100 microseconds.
> Has 28 PST tables. (Only dumping ones relevant to this CPU).
> PST:26 (@0x4018f6bc)
>  cpuid: 0x780	  fsb: 100	  maxFID: 0x14	  startvid: 0xe
>  num of p states in this table: 5
>    FID: 0x4 (5.0x [500MHz])	VID: 0xe (1.300V)
>    FID: 0x8 (7.0x [700MHz])	VID: 0xe (1.300V)
>    FID: 0xc (9.0x [900MHz])	VID: 0xe (1.300V)
>    FID: 0x0 (11.0x [1100MHz])	VID: 0xe (1.300V)
>    FID: 0x14 (13.0x [1300MHz])	VID: 0xe (1.300V)
> 
> Connector type: Socket A (462 Pin PGA)
> 
> I think the FIDs are OK, but the VIDs are all equal (but "VID changes 
> will happen") - this means the cpu consumes to much power :-(
> My idea was that people with a correct PST table for the ATHLON 1500+ 
> (and other CPUs) can give the right values, because in my opinion this 
> values are CPU specific and not PST/BIOS specific....
> 

well, actually I meant for peoples with 'good' PST.

If you look the output from x86info:

> Has 28 PST tables. (Only dumping ones relevant to this CPU).
      ^^              ^^^^ 

Therefore, by replacing in AMD/dumppst.c
if ((etuple(cpu) == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))

by
if(1)

you may have hopefully more 'good' PST tables from peoples which have
good bios perhaps.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Call4Response: Correct PST table for ATHLONs
Date: Wed, 2 Jul 2003 16:02:06 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030702140206.GP7796@poupinou.org>
References: <3F028F2C.5020704@searchbroker.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F028F2C.5020704@searchbroker.de>
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

On Wed, Jul 02, 2003 at 09:52:12AM +0200, Lars Gemeinhardt wrote:
> Hello cpufreq-user and developer,
> 
> can everybody with an correct PST table (diffent FIDs and VIDs) and an 
> ATHLON cpu post the "dmesg" snip (you get this using the dmesg command 
> after the modul is loaded) to this mailing-list...
> Maybe we can setup with this the correct values to the cpufreq driver 
> (the K7 powernow part)...then otherwise the Acer and Sony notebooks 
> doesn't work perfectly :-(
> 


You may want perhaps to get x86info instead.

Just do something like that:

cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/x86info co x86info

then edit AMD/dumppsb.c
at a line which look like

if ((etuple(cpu) == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))

replace with
if (1)

Then all PST tables should be dumped for different cpuid.


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

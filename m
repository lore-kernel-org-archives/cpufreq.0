From: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Subject: PST tables and Sonys Bios
Date: Thu, 17 Jul 2003 09:31:15 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F1650C3.1030903@searchbroker.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi developer and user,

Sony Bios (and the PST tables) maybe don't like the powernow feature, 
because yesterday I have updated my FX705 from Bios (R0117K5) to the 
latest one (R0121K5) and then I dump all PST tables (with powernow 
infos) and found that they do not fix the "PST:26" for my CPU (all VIDs 
are 1.3V), no they change the correct (?) "PST:27" (maybe for the 1600+) 
from:

 PST:27 (@0x401906ce)
  cpuid: 0x780    fsb: 100        maxFID: 0x16    startvid: 0x11
  num of p states in this table: 6
    FID: 0x4 (5.0x [500MHz])    VID: 0x19 (1.050V)
    FID: 0x6 (6.0x [600MHz])    VID: 0x19 (1.050V)
    FID: 0x8 (7.0x [700MHz])    VID: 0x19 (1.050V)
    FID: 0xc (9.0x [900MHz])    VID: 0x19 (1.050V)
    FID: 0x0 (11.0x [1100MHz])  VID: 0x15 (1.150V)
    FID: 0x16 (14.0x [1400MHz]) VID: 0xe (1.300V)

to:

 PST:27 (@0x401906be)
  cpuid: 0x780    fsb: 100        maxFID: 0x16    startvid: 0xe
  num of p states in this table: 6
    FID: 0x4 (5.0x [500MHz])    VID: 0xe (1.300V)
    FID: 0x6 (6.0x [600MHz])    VID: 0xe (1.300V)
    FID: 0xa (8.0x [800MHz])    VID: 0xe (1.300V)
    FID: 0xe (10.0x [1000MHz])  VID: 0xe (1.300V)
    FID: 0x2 (12.0x [1200MHz])  VID: 0xe (1.300V)
    FID: 0x16 (14.0x [1400MHz]) VID: 0xe (1.300V)

Now the VIDs for this cpu are also all 1.3V :-(

Is there a chance to include a fix in the powernow-k7 code "for broken 
PST tables" or should everybody make it's own patch like "Luigi Belli" 
in "Acer Aspire 1300 buggy BIOS - hardcoded patch" 
(http://www.linux.org.uk/mailman/private/cpufreq/2003-June/002171.html)?

Ciao Lars

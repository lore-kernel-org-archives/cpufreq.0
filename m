From: Alex Simonov <a_simonov@yahoo.com>
Subject: Re: Mobile Athlon XP 1900+ PST table ???
Date: Thu, 18 Sep 2003 13:22:11 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030918202211.67959.qmail@web20807.mail.yahoo.com>
References: <20030918102226.GH11391@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-221946474-1063916531=:67749"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030918102226.GH11391@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

--0-221946474-1063916531=:67749
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Hi Bruno,

Unfortunately I installed MDK 9.1 after my CPU
"upgrade", so I don't believe I will find any 1
GHz Mobile Duron related stuff in /var/log. But I
have dumped the PSB table (attached) with all 28
PST tables of all BIOS supported CPUs. The data
for Duron 1GH are as follow (at relative address
0x77568):

CPUID: 762
fsb: 0x64 (100 MHz)
settling time: 0x64 (100 ms)
maxfid: 0xE (10x)
startvid: 0xC
num states: 5

     FID         VID
1. 0x4 (5x)   0x13 (1.200 V)
2. 0x6 (6x)   0x11 (1.250 V)
3. 0x8 (7x)   0xE  (1.300 V)
4. 0xA (8x)   0xD  (1.350 V)
5. 0xE (10x)  0xD  (1.350 V)

Where should I modify the code to hardwire the
values? Could you give me a hint? I tried the
same patch for Acer 1800+ notebooks (
http://www.lug-owl.de/pipermail/linux/2003-July/019183.html
), replacing with different values for 1900+, but
with no effect. The problem is that decode_bios
fuction always returns zero.  

Thanks a lot in advance,

Alex



> 
> Hard to tell, unfortunately.  Not only the CPU
> but also the voltage
> regulator system have to be known.  It may be
> possible that you can
> take at least the values of the one for cpuid
> 0x780, but
> your x86info show that you may be able to make
> change to vid as well.
> 
> If by chance you have a dmesg with the duron in
> /var/log...
> 
> -- 
> Ducrot Bruno
> 
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
--0-221946474-1063916531=:67749
Content-Type: text/plain; name="VAIO_PSB.txt"
Content-Description: VAIO_PSB.txt
Content-Disposition: inline; filename="VAIO_PSB.txt"

000774D0  41 4D 44 4B 37 50 4E 4F 57 21 12 00 64 00 00 1C    AMDK7PNOW!..d...
000774E0  61 07 00 00 64 0B 0C 04 04 13 06 0D 08 0C 0B 0C    a...d...........
000774F0  61 07 00 00 64 0C 0C 04 04 13 06 0E 08 0D 0C 0C    a...d...........
00077500  61 07 00 00 64 0D 0C 05 04 13 06 11 08 0E 0A 0D    a...d...........
00077510  0D 0C 61 07 00 00 64 0E 0C 05 04 13 06 11 08 0E    ..a...d.........
00077520  0A 0D 0E 0C 61 07 00 00 64 00 0C 05 04 13 06 13    ....a...d.......
00077530  08 13 0C 0D 00 0C 62 07 00 00 64 0B 0C 04 04 13    ......b...d.....
00077540  06 0D 08 0C 0B 0C 62 07 00 00 64 0C 0C 04 04 13    ......b...d.....
00077550  06 0E 08 0D 0C 0C 62 07 00 00 64 0D 0C 05 04 13    ......b...d.....
00077560  06 11 08 0E 0A 0D 0D 0C 62 07 00 00 64 0E 0C 05    ........b...d...
00077570  04 13 06 11 08 0E 0A 0D 0E 0C 62 07 00 00 64 00    ..........b...d.
00077580  0C 05 04 13 06 13 08 11 0C 0D 00 0C 62 07 00 00    ............b...
00077590  64 02 0D 05 04 13 06 13 0A 13 0E 0E 02 0D 70 07    d.............p.
000775A0  00 00 64 0A 0A 05 04 13 05 0E 06 0D 08 0B 0A 0A    ..d.............
000775B0  70 07 00 00 64 0B 0A 05 04 13 05 11 06 0E 08 0C    p...d...........
000775C0  0B 0A 70 07 00 00 64 0C 0B 05 04 13 06 11 08 0E    ..p...d.........
000775D0  0A 0C 0C 0B 70 07 00 00 64 0D 0B 05 04 13 06 13    ....p...d.......
000775E0  08 11 0B 0C 0D 0B 70 07 00 00 64 0E 0C 05 04 13    ......p...d.....
000775F0  06 13 08 13 0C 0D 0E 0C 70 07 00 00 64 00 0C 05    ........p...d...
00077600  04 13 06 13 08 11 0C 0D 00 0C 70 07 00 00 64 02    ..........p...d.
00077610  0D 05 04 13 06 13 0A 13 0E 0E 02 0D 71 07 00 00    ............q...
00077620  64 0A 0A 05 04 13 05 0E 06 0D 08 0B 0A 0A 71 07    d.............q.
00077630  00 00 64 0B 0A 05 04 13 05 11 06 0E 08 0C 0B 0A    ..d.............
00077640  71 07 00 00 64 0C 0B 05 04 13 06 13 08 0E 0A 0C    q...d...........
00077650  0C 0B 71 07 00 00 64 0D 0B 05 04 13 06 13 08 11    ..q...d.........
00077660  0B 0C 0D 0B 71 07 00 00 64 0E 0C 05 04 13 06 13    ....q...d.......
00077670  08 13 0C 0D 0E 0C 71 07 00 00 64 00 0C 05 04 13    ......q...d.....
00077680  06 13 08 11 0C 0D 00 0C 71 07 00 00 64 02 0D 05    ........q...d...
00077690  04 13 06 13 0A 13 0E 0E 02 0D 80 07 00 00 64 02    ..........���...d.
000776A0  0E 05 04 0E 06 0E 0A 0E 0E 0E 02 0E 80 07 00 00    ............���...
000776B0  64 14 0E 05 04 0E 08 0E 0C 0E 00 0E 14 0E 80 07    d.............���.
000776C0  00 00 64 16 0E 06 04 0E 06 0E 0A 0E 0E 0E 02 0E    ..d.............
000776D0  16 0E 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
000776E0  5F 53 4D 5F 00 1F 02 03 59 00 00 00 00 00 00 00    _SM_....Y.......
000776F0  5F 44 4D 49 5F 00 00 00 00 00 00 00 29 00 23 00    _DMI_.......).#.
00077700  52 53 44 20 50 54 52 20 00 50 54 4C 54 44 20 00    RSD PTR .PTLTD .
00077710  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
00077720  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
00077730  5F 33 32 5F 00 00 00 00 00 01 00 00 00 00 00 00    _32_............
00077740  24 50 44 4D 01 0B 00 48 9C 00 F0 00 00 00 00 00    $PDM...H���.���.....
00077750  24 50 4D 4D 01 10 00 51 42 1A 71 00 00 00 00 00    $PMM...QB.q.....
00077760  24 50 6E 50 10 21 00 00 00 00 04 00 00 B4 AA 00    $PnP.!.......������.
00077770  F0 D2 AA 00 00 0F 00 00 00 00 00 40 00 00 04 00    ���������........@....
00077780  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
--0-221946474-1063916531=:67749
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--0-221946474-1063916531=:67749--


From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [powernow-k7] PSB and number of PSTs do not match, sometimes.
Date: Mon, 22 Mar 2004 14:04:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322130454.GR28592@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qOrJKOH36bD5yhNe"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Running the attached tool, and 'overriding' a little the number of PST
given in PSB show that they can sometimes not match.

Example for a Presario_2195US:
PSB version: 12 flags: 0 settling time 100us res1 0 num pst 14
Overriding number of pst :19
  PST 1  cpuid 780 fsb 133 mfid c svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 0e (1300mV)
    4  1197000kHz  FID 0c ( 9.0)  VID 0b (1450mV)
  PST 2  cpuid 780 fsb 133 mfid e svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 11 (1250mV)
    4  1330000kHz  FID 0e (10.0)  VID 0b (1450mV)
  PST 3  cpuid 780 fsb 133 mfid f svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 0c (1400mV)
    4  1396500kHz  FID 0f (10.5)  VID 09 (1550mV)
  PST 4  cpuid 780 fsb 133 mfid 0 svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0c (1400mV)
    4  1463000kHz  FID 00 (11.0)  VID 09 (1550mV)
  PST 5  cpuid 780 fsb 133 mfid 1 svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1529500kHz  FID 01 (11.5)  VID 09 (1550mV)
  PST 6  cpuid 780 fsb 133 mfid 2 svid a numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 11 (1250mV)
    4  1596000kHz  FID 02 (12.0)  VID 0a (1500mV)
  PST 7  cpuid 780 fsb 133 mfid 3 svid a numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1330000kHz  FID 0e (10.0)  VID 0e (1300mV)
    5  1662500kHz  FID 03 (12.5)  VID 0a (1500mV)
  PST 8  cpuid 781 fsb 133 mfid f svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 0e (1300mV)
    4  1396500kHz  FID 0f (10.5)  VID 0b (1450mV)
  PST 9  cpuid 781 fsb 133 mfid 0 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1463000kHz  FID 00 (11.0)  VID 0b (1450mV)
  PST 10  cpuid 781 fsb 133 mfid 1 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1529500kHz  FID 01 (11.5)  VID 0b (1450mV)
  PST 11  cpuid 781 fsb 133 mfid 2 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)
  PST 12  cpuid 781 fsb 133 mfid 3 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 11 (1250mV)
    4  1330000kHz  FID 0e (10.0)  VID 0d (1350mV)
    5  1662500kHz  FID 03 (12.5)  VID 0b (1450mV)
  PST 13  cpuid 781 fsb 133 mfid 15 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 13 (1200mV)
    4  1330000kHz  FID 0e (10.0)  VID 0e (1300mV)
    5  1795500kHz  FID 15 (13.5)  VID 0b (1450mV)
  PST 14  cpuid 781 fsb 133 mfid 16 svid b numberstates 5
    0  1130500kHz  FID 0b ( 8.5)  VID 13 (1200mV)
    1  1396500kHz  FID 0f (10.5)  VID 0e (1300mV)
    2  1529500kHz  FID 01 (11.5)  VID 0d (1350mV)
    3  1662500kHz  FID 03 (12.5)  VID 0c (1400mV)
    4  1862000kHz  FID 16 (14.0)  VID 0b (1450mV)
  PST 15  cpuid 7a0 fsb 133 mfid 15 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
    5  1795500kHz  FID 15 (13.5)  VID 0b (1450mV)
  PST 16  cpuid 7a0 fsb 133 mfid 16 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
    5  1862000kHz  FID 16 (14.0)  VID 0b (1450mV)
  PST 17  cpuid 7a0 fsb 133 mfid 18 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0e (1300mV)
    5  1995000kHz  FID 18 (15.0)  VID 0b (1450mV)
  PST 18  cpuid 7a0 fsb 133 mfid 2 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)
  PST 19  cpuid 1c2b1bd9 fsb 95 mfid 1e svid f6 numberstates 30
    0   475000kHz  FID 04 ( 5.0)  VID 2b (874850336mV)
    1 205101796kHz  FID ffffff9c (118633676.7)  VID 00 (2000mV)


the number of PST given in the PSB is 14, whereas it should be 18,

The exact same issue apply for the HP NX9005:

PSB version: 12 flags: 0 settling time 100us res1 0 num pst 14
Overriding number of pst :18
  PST 1  cpuid 780 fsb 133 mfid c svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 0e (1300mV)
    4  1197000kHz  FID 0c ( 9.0)  VID 0b (1450mV)
  PST 2  cpuid 780 fsb 133 mfid e svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 11 (1250mV)
    4  1330000kHz  FID 0e (10.0)  VID 0b (1450mV)
  PST 3  cpuid 780 fsb 133 mfid f svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 0c (1400mV)
    4  1396500kHz  FID 0f (10.5)  VID 09 (1550mV)
  PST 4  cpuid 780 fsb 133 mfid 0 svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0c (1400mV)
    4  1463000kHz  FID 00 (11.0)  VID 09 (1550mV)
  PST 5  cpuid 780 fsb 133 mfid 1 svid 9 numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1529500kHz  FID 01 (11.5)  VID 09 (1550mV)
  PST 6  cpuid 780 fsb 133 mfid 2 svid a numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 11 (1250mV)
    4  1596000kHz  FID 02 (12.0)  VID 0a (1500mV)
  PST 7  cpuid 780 fsb 133 mfid 3 svid a numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1330000kHz  FID 0e (10.0)  VID 0e (1300mV)
    5  1662500kHz  FID 03 (12.5)  VID 0a (1500mV)
  PST 8  cpuid 781 fsb 133 mfid f svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 0e (1300mV)
    4  1396500kHz  FID 0f (10.5)  VID 0b (1450mV)
  PST 9  cpuid 781 fsb 133 mfid 0 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1463000kHz  FID 00 (11.0)  VID 0b (1450mV)
  PST 10  cpuid 781 fsb 133 mfid 1 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1529500kHz  FID 01 (11.5)  VID 0b (1450mV)
  PST 11  cpuid 781 fsb 133 mfid 2 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)
  PST 12  cpuid 781 fsb 133 mfid 3 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 11 (1250mV)
    4  1330000kHz  FID 0e (10.0)  VID 0d (1350mV)
    5  1662500kHz  FID 03 (12.5)  VID 0b (1450mV)
  PST 13  cpuid 781 fsb 133 mfid 15 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3   931000kHz  FID 08 ( 7.0)  VID 13 (1200mV)
    4  1330000kHz  FID 0e (10.0)  VID 0e (1300mV)
    5  1795500kHz  FID 15 (13.5)  VID 0b (1450mV)
  PST 14  cpuid 781 fsb 133 mfid 16 svid b numberstates 5
    0  1130500kHz  FID 0b ( 8.5)  VID 13 (1200mV)
    1  1396500kHz  FID 0f (10.5)  VID 0e (1300mV)
    2  1529500kHz  FID 01 (11.5)  VID 0d (1350mV)
    3  1662500kHz  FID 03 (12.5)  VID 0c (1400mV)
    4  1862000kHz  FID 16 (14.0)  VID 0b (1450mV)
  PST 15  cpuid 7a0 fsb 133 mfid 15 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
    5  1795500kHz  FID 15 (13.5)  VID 0b (1450mV)
  PST 16  cpuid 7a0 fsb 133 mfid 16 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0d (1350mV)
    5  1862000kHz  FID 16 (14.0)  VID 0b (1450mV)
  PST 17  cpuid 7a0 fsb 133 mfid 18 svid b numberstates 6
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1064000kHz  FID 0a ( 8.0)  VID 13 (1200mV)
    4  1463000kHz  FID 00 (11.0)  VID 0e (1300mV)
    5  1995000kHz  FID 18 (15.0)  VID 0b (1450mV)
  PST 18  cpuid 7a0 fsb 133 mfid 2 svid b numberstates 5
    0   532000kHz  FID 12 ( 4.0)  VID 13 (1200mV)
    1   665000kHz  FID 04 ( 5.0)  VID 13 (1200mV)
    2   798000kHz  FID 06 ( 6.0)  VID 13 (1200mV)
    3  1197000kHz  FID 0c ( 9.0)  VID 0d (1350mV)
    4  1596000kHz  FID 02 (12.0)  VID 0b (1450mV)


I know that the same OEM, but perhaps this may be the case for the ASUS?

Note that the cpuid (in fact, the value of EAX with cpuid function
0x80000001) will be 7a0...

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--qOrJKOH36bD5yhNe
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="dump_psb.c"

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/mman.h>

#define LEN (0x100000 - 0xc0000)
#define OFFSET (0xc0000)

#ifndef __packed
#define __packed __attribute((packed))
#endif

static const int fid_to_mult[32] = {
	110, 115, 120, 125, 50, 55, 60, 65,
	70, 75, 80, 85, 90, 95, 100, 105,
	30, 190, 40, 200, 130, 135, 140, 210,
	150, 225, 160, 165, 170, 180, -1, -1,
};

static const int vid_to_voltage[32] = {
	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
	1600, 1550, 1500, 1450, 1400, 1350, 1300, 0,
	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
	1075, 1050, 1024, 1000, 975, 950, 925, 0,
}; 

struct psb_header {
	char signature[10];
	u_char version;
	u_char flags;
	u_short settlingtime;
	u_char res1;
	u_char numpst;
} __packed;

struct pst_header {
	u_int32_t cpuid;
	u_char fsb;
	u_char maxfid;
	u_char startvid;
	u_char numpstates;
} __packed;

static u_int fsb;
static u_int sgtc;

static int
decode_pst(char *p, int npstates)
{
	int i;
	int freq, fid, vid;

	for (i = 0; i < npstates; ++i) {
		fid = *p++;
		vid = *p++;
		freq = 100 * fid_to_mult[fid] * fsb;

		printf("   %2d %8dkHz  FID %02x (%2d.%01d)  VID %02x (%4dmV)\n",
		       i,
		       freq,
		       fid, fid_to_mult[fid]/10, fid_to_mult[fid]%10,
		       vid, vid_to_voltage[vid]);
	}

	return 0;
}

static
void decode_psb(char *p, int numpst)
{
	int i;
	struct psb_header *psb;
	struct pst_header *pst;

	psb = (struct psb_header*) p;

	if (psb->version != 0x12)
		return;

	printf("PSB version: %hhx flags: %hhx settling time %hhuus res1 %hhx num pst %hhu\n",
			psb->version,
			psb->flags,
			psb->settlingtime,
			psb->res1,
			psb->numpst);
	sgtc = psb->settlingtime * 100;

	if (sgtc < 10000)
		sgtc = 10000;

	p = ((char *) psb) + sizeof(struct psb_header);

	if (numpst < 0)
		numpst = psb->numpst;
	else
		printf("Overriding number of pst :%d\n", numpst);

	for (i = 0; i < numpst; i++) {
		pst = (struct pst_header*) p;

		printf("  PST %d  cpuid %.3x fsb %hhu mfid %hhx svid %hhx numberstates %hhu\n",
				i+1,
				pst->cpuid,
				pst->fsb,
				pst->maxfid,
				pst->startvid,
				pst->numpstates);

		fsb = pst->fsb;
		decode_pst(p + sizeof(struct pst_header), pst->numpstates);
		p += sizeof(struct pst_header) + 2*pst->numpstates;
	}

}

int
main(int argc, char *argv[])
{
	int fd;
	int numpst;
	char *mem = NULL;
	char *p;

	if (argc < 2)
		numpst = -1;
	else
		numpst = strtoul(argv[1], NULL, 0);

	fd = open("/dev/mem", O_RDONLY);
	if (fd < 0) {
		exit(1);
	}

	mem = mmap(mem, 0x100000 - 0xc0000, PROT_READ, MAP_SHARED, fd, 0xc0000);
	close(fd);

	for (p = mem; p - mem < LEN; p+=16) {
		if (memcmp(p, "AMDK7PNOW!", 10) == 0) {
			decode_psb(p, numpst);
			break;
		}
	}

	munmap(mem, LEN);
	return 0;
}

--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--qOrJKOH36bD5yhNe--


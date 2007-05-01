From: Christopher.Osborn@ubs.com
Subject: CPUFREQ Governer and system usage
Date: Tue, 1 May 2007 12:20:43 -0400
Message-ID: <722B40942079074FA7A702110760179702C815F8@NSTMC103PEX1.ubsw.net>
References: <E1Hh1hk-0005Bm-0G@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <E1Hh1hk-0005Bm-0G@ZenIV.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

=20
Hello,

I was carrying out some tests on the ondemand governor in relation to
latency benchmarks using LMBench.

The current governors seem to only check the USR space for CPU usage in
determining if the system clock rate should be increased. This can be
replicated by using lmbench and the bw_pipe test. Bw_pipe will flood a
pipe to get MAX bandwidth.=20

While this might not be a problem in the real world, it may cause some
issues with processes that require a lot of SYS space without a lot of
userspace interaction.

Here were the results(which are directly proportional to the CPUSPEED as
shown through the current_speed)

WITH MAXPERFORMANCE
--------------------------
$VAR1 =3D 'bw_pipe';
$VAR2 =3D '1788.75';
$VAR3 =3D 'bw_mem';
$VAR4 =3D {
          'fcp' =3D> '2609.97',
          'cp' =3D> '3834.97',
          'frd' =3D> '5351.96',
          'rdwr' =3D> '5781.82',
          'fwr' =3D> '4949.31',
          'wr' =3D> '7846.35',
          'bzero' =3D> '4885.64',
          'rd' =3D> '7697.91',
          'bcopy' =3D> '2642.06'
        };
$VAR5 =3D 'lat_proc';
$VAR6 =3D {
          'fork' =3D> '203.1852',
          'exec' =3D> '217.9231'
        };
$VAR7 =3D 'lat_pipe';
$VAR8 =3D '10.7427';

------------------------------------------------------------
WITH ONDEMAND
------------------------------------------------------------

$VAR1 =3D 'bw_pipe';
$VAR2 =3D '1251.39';
$VAR3 =3D 'bw_mem';
$VAR4 =3D {
          'fcp' =3D> '2621.93',
          'cp' =3D> '3823.16',
          'frd' =3D> '5352.27',
          'rdwr' =3D> '5730.40',
          'fwr' =3D> '4895.74',
          'wr' =3D> '7826.72',
          'bzero' =3D> '4886.47',
          'rd' =3D> '7679.71',
          'bcopy' =3D> '2641.58'
        };
$VAR5 =3D 'lat_proc';
$VAR6 =3D {
          'fork' =3D> '211.2593',
          'exec' =3D> '216.2222'
        };
$VAR7 =3D 'lat_pipe';
$VAR8 =3D '9.1837';


Chris=20
Visit our website at http://www.ubs.com

This message contains confidential information and is intended only 
for the individual named.  If you are not the named addressee you 
should not disseminate, distribute or copy this e-mail.  Please 
notify the sender immediately by e-mail if you have received this 
e-mail by mistake and delete this e-mail from your system.
	
E-mails are not encrypted and cannot be guaranteed to be secure or 
error-free as information could be intercepted, corrupted, lost, 
destroyed, arrive late or incomplete, or contain viruses.  The sender 
therefore does not accept liability for any errors or omissions in the 
contents of this message which arise as a result of e-mail transmission.  
If verification is required please request a hard-copy version.  This 
message is provided for informational purposes and should not be 
construed as a solicitation or offer to buy or sell any securities 
or related financial instruments.

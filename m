From: Brendt Wohlberg <bwohlberg@gmail.com>
Subject: powernow-k8: missing p-state
Date: Sun, 7 Aug 2005 18:13:46 -0600
Message-ID: <3f72be670508071713510f5697@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I have an AMD 64 3200+ processor with 4 p-states (according to AMD
specs), with frequencies of 1.0, 1.8, 2.0, and 2.2 GHz. On boot
(Fedora Core 4, kernel 2.6.12), however, the powernow-k8 module only
recognises the highest three frequencies

  powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.40.2)
  powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
  powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
  powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)

My guess is that this problem is due to a buggy BIOS. Are there any existin=
g=20
solutions to this problem? Given the apparent number of AMD 64 motherboards=
=20
with similar problems, surely it would be useful to be able to specify
the p-state
table as a configuration option for the powernow-k8 module?

Brendt

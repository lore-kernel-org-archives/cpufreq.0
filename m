From: Gionn <scurippio@gmail.com>
Subject: Lost cpu scaling after BIOS upgrade on Asus F3jc (Intel T2050)
Date: Sun, 20 May 2007 16:38:29 +0200
Message-ID: <2e2245b30705200738wcfed3bbqa0019c962740fac5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=QNFJ1j2GBVYnze4GDSaGf7Hgzx2mfSLrOV9hR4/VA1svLbvxQI1iRwvDDGnsjTte9Crb3nQZqIUoTlnVFY6aVOCrDIgZ2zCMuH2+lDq5yPO/sVEFaaQgGFjJqdbULjU1lSGClgiIh9cwWYrSkX0oGsSrJ5etMLNI88dJWZPgG4Q=
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi to all.

I was using, without any problems, frequency scaling with powernowd on
2.6.20-15-generic (ubuntu feisty default kernel).

After doing a BIOS upgrade for resolving other problems on my Asus
F3jc, frequency scaling stopped working: both speedstep_centrino and
acpi-cpufreq say no such device.
Dislike I was hoping, Asus don't keep older bios release available for
download, so I cannot downgrade in any way.

If can be useful, last BIOS image is here:
http://dlsvr01.asus.com/pub/ASUS/nb/F3Jc/F3Jc305AS.ZIP
and here there is the changelog
- To fix system cannot do battery pre-charge process when an
unknown/failure battery insert.
- Support Intel Extend ID CPU:Merom Celeron 530 CPU.

Also release 304 (the oldest available for download), don't work.
Link: http://dlsvr01.asus.com/pub/ASUS/nb/Z96J/F3Jc304AS.ZIP
Changelog:
- Update new CPU Microcode
- System plays wave file and causes garbage sound.


Every kind of reply is much appreciated :p


Scorp
http://blog.scorpionworld.it/
L'informatico e` l'anello mancante tra l'uomo ed il computer.

From: "=?utf-8?Q?davidendless@email.it?=" <davidendless@email.it>
Subject: =?iso-8859-1?Q?Re:_Acer_Aspire_1300_buggy_BIOS_-_hardcoded_patch?=
Date: Tue,  1 Jul 2003 14:24:57 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <HHCIHL$1E3F934F29A61EC7E7E81C8DC7239981@email.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?Q?cpufreq?= <cpufreq@www.linux.org.uk>

> I'm one of the owners of an Acer Aspire 1300 series with a buggy=0D=0ABIOS, so I=0D=0A> decided to hardcode a patch with the correct PST table for my mobile=0D=0AAthlon=0D=0A> XP 1800+.=0D=0A=0D=0AI tried the patch, and it seemed to work. Then I did some tests and I=0D=0Afound =0D=0Athat in powersave (cat /proc/cpuinfo: cpu MHz 666.705) it runs faster=0D=0Athan at =0D=0Afullspeed (1533.422).=0D=0A=0D=0ATo test speed I used nbench and this simple script (in xterm at=0D=0Afullscreen):=0D=0A=0D=0A$ time for i in `seq 50000`; do echo "aaaa"; done=0D=0A=0D=0AIt took about 2,6 seconds without the powernow-k7 module loaded, the=0D=0Asame time =0D=0Awith module loaded and powersave, and about 3,9 seconds with full=0D=0Apower and =0D=0Amodule loaded.=0D=0A=0D=0AIsn't it strange?=0D=0ADo you have the same behaviour?=0D=0A=0D=0ADavid=0D=0A



--
Email.it, the professional e-mail, gratis per te: http://www.email.it/f

Sponsor:
Natsabe.it la pi=F9 grande erboristeria multimarca online.
Solo prodotti di altissima qualit=E0.=20

Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D1308&d=3D1-7

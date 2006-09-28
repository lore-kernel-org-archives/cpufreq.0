From: ataschi@sms.at
Subject: Re: powernow with kt133
Date: Thu, 28 Sep 2006 20:53:12 +0200
Message-ID: <20060928185312.B766D8450E@mail.sms.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

Hi all,
got the hint, that this mailing list will have an answer .. could be,hm?
so i forward my questions ...

 > I googled now for more than a week to find a solution for my freezing pr=
oblem.
 > I used the VIA KT133 chipset on an MS-6330 (MSI K7T Pro 2-A) motherboard.
 > Immediatly after I press the enter key to load the powernow-k7 module (k=
ernel 2.6.17)
 > everything is freezed. Even so fast that no log will be produced.
 >
 > My first assumption was: compatibilty problems of the modul with my AMD =
Geode NX 1750.
 >   -> no, definitly not
 >
 > second assumption: chipset problem, KT133 (and it's not the KT133A !) do=
 not support
 >   powernow! But .. I found a report where exactly this chipset will be u=
sed in a
 >   Notebook
 >   http://stupidius.dyndns.org/linux_on_maxdata_m-book/index.html
 >   -> in this case PST tables are available
 >   -> but on my desktop system they are not --> thus, I used your patch ;)
 >
 > third and last assumption: The MS-6330 does something weired or better, =
doesn't handel
 >   the FID signals or the FID_Change procedure in a correct way. Now, I'm=
 not sure if
 >   this is a hardware problem or can be solved by software.
 >
 > My question: Do you know something about this stuff?? Can you help me? C=
an help me
 >   anyone?
 >
 > By the way: Do you know something about the VT8363 chipset register 55? =
On KT133A it
 >   seems, it will enable the chipset for powernow!!??

wbr
armin

--
Ein Service von http://www.sms.at

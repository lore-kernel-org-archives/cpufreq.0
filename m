From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Temporary freezes in AMD Sempron 2800+
Date: Mon, 6 Jun 2005 15:45:51 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC0DA@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ramkumar R <andyetitmoves@gmail.com>, Michal Pytasz <mpytasz@posejdon.wpk.p.lodz.pl>, cpufreq@lists.linux.org.uk

> well...i guess i was a bit hasty...the p-states driver was=20
> not the problem...rather, a more interesting pattern has come=20
> up...it seems that the freeze occurs whenever i am on a X=20
> display (i.e. it isn't even a problem when i have X running=20
> and i am in one of the tty's)...in fact, to confirm my=20
> doubts, I set up my .Xsession to simply loop, sleeping for a=20
> second, and toggling between the two frequencies. It freezes=20
> when i am on the X display, and the problem disappears the=20
> moment i do a alt+f1...this is really strange...

Sounds like a potential motherboard issue.  Some low-end
motherboards don't have large enough PCI data buffers to
store all the way through a pstate transition.  There's=20
not a lot I can do about it.

-Mark Langsdorf
AMD, Inc.

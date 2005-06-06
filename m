From: Ramkumar R <andyetitmoves@gmail.com>
Subject: Re: Temporary freezes in AMD Sempron 2800+
Date: Tue, 7 Jun 2005 02:08:58 +0530
Message-ID: <9a9bfc1705060613381ff99a1d@mail.gmail.com>
References: <9a9bfc1705060607494838bc6c@mail.gmail.com>
	<200506061906.16327.mpytasz@pai.net.pl>
	<9a9bfc170506061021620e487a@mail.gmail.com>
	<200506061956.16644.mpytasz@posejdon.wpk.p.lodz.pl>
	<9a9bfc1705060611114a1f2596@mail.gmail.com>
	<9a9bfc170506061223354456e6@mail.gmail.com>
Reply-To: Ramkumar R <andyetitmoves@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9a9bfc170506061223354456e6@mail.gmail.com>
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
To: =?ISO-8859-2?Q?Micha=B3_Pytasz?= <mpytasz@posejdon.wpk.p.lodz.pl>, cpufreq@lists.linux.org.uk

well...i guess i was a bit hasty...the p-states driver was not the
problem...rather, a more interesting pattern has come up...it seems
that the freeze occurs whenever i am on a X display (i.e. it isn't
even a problem when i have X running and i am in one of the
tty's)...in fact, to confirm my doubts, I set up my .Xsession to
simply loop, sleeping for a second, and toggling between the two
frequencies. It freezes when i am on the X display, and the problem
disappears the moment i do a alt+f1...this is really strange...

Ramkumar.
--=20
The day Microsoft makes something that doesn't suck
is probably the day they start making vacuum cleaners.
                                               -Ernst Jan Plugge

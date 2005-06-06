From: Ramkumar R <andyetitmoves@gmail.com>
Subject: Temporary freezes in AMD Sempron 2800+
Date: Mon, 6 Jun 2005 07:49:14 -0700
Message-ID: <9a9bfc1705060607494838bc6c@mail.gmail.com>
Reply-To: Ramkumar R <andyetitmoves@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi!

I have a laptop with an AMD Sempron 2800+ (Acer Aspire 3002NLC). The
machine seems to get unresponsive every time the frequency changes
(the music stops for a second, say)...I tested this by using the
ondemand kernel governor. I use linux-2.6.12-rc4-ck1 with the inotify
patch. (With two more modules, fuse and cdfs, but I guess that
wouldn't matter much). Watching the current frequency file in /sys
shows that this sudden freeze occurs whenever the value changes.

Thanx,
Ramkumar.

--=20
The day Microsoft makes something that doesn't suck
is probably the day they start making vacuum cleaners.
                                               -Ernst Jan Plugge

From: "Matteo Giordano" <ilmalteo@gmail.com>
Subject: Make overclock possible with cpufreq
Date: Sun, 28 May 2006 22:26:56 +0200
Message-ID: <6d24915a0605281326j597faae7u49daaf78c962e2db@mail.gmail.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi,
I just subscribed to the list to address this issue (I think it's an *issue=
*).
I'm not a kernel hacker so I'm just guessing here, even if I searched
and tried all the afternoon.
It's not possible to use cpufreq with an overclocked CPU because the
processor's frequencies are "hardcoded" somewhere (the BIOS or a PSB
table?).
So if I push my Athlon 64 3200+ to 2.4GHz the "performance" governor
will always put it to 2GHz max, causing the overclock to be useless.

Isn't really possible to take the _actual_ frequencies into cpufreq?

Matteo

From: =?utf-8?q?Micha=C5=82_Pytasz?= <mpytasz@pai.net.pl>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 22:15:33 +0000
Message-ID: <200411162215.33814.mpytasz@pai.net.pl>
References: <200411161753.11367.mpytasz@pai.net.pl>
	<20041116204703.GA9138@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041116204703.GA9138@dominikbrodowski.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="macroman"
To: cpufreq@www.linux.org.uk

> AFAICS, your system only supports two frequency states with different
> voltages. Also, the powernow-k8 driver complains if one transition
> (frequency or voltage) fails. So you can be quite sure that the voltage
> changes as well.

OK, thanks, I believe You are right. Although I can see frequencies in betw=
een=20
800 and 1600 in the debug log for powernowd-k8, they do not seem to affect=
=20
cpuinfo_curr_freq (dummy values ?).

Micha=C5=82

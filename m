From: Burelli Luca 435260/IF <burellil@dei.unipd.it>
Subject: Re: [PATCH] cpufreq_ondemand.c: minimum frequency limit
Date: Thu, 25 Nov 2004 13:28:01 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0411251323580.13435@flora>
References: <Pine.LNX.4.61.0411251053140.12476@flora>
	<20041125111131.GA16620@poupinou.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1567402325-894727740-1101385681=:13435"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041125111131.GA16620@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1567402325-894727740-1101385681=:13435
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Nov 2004, Bruno Ducrot wrote:

> Why not just tweaking
> /sys/devices/system/cpu/cpu*/cpufreq/scaling_{min,max}_freq instead?

Because I did not know/check that these were writable... I thought these=20
were the minimum and maximum absolute values that the CPU supported (like=
=20
first and last items in "scaling_available_frequencies"). Shame on me.=20
I'll go and sit in the corner... :)
Thanks for the hint!
Luca


--=20
"I have seen things you people would not believe. Attack ships on fire of=
f
the shoulder of Orion.  C-beams glittering in the dark near the Tannh=E4u=
ser
Gate.  But... all those moments will be lost in time, like tears in rain.=
"
                                      (Roy Batty, from Blade Runner, 1982=
)
---1567402325-894727740-1101385681=:13435
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

---1567402325-894727740-1101385681=:13435--


From: Nebojsa Trpkovic <trx@inbox.ru>
Subject: powernow-k8 manual voltage selection ?
Date: Sun, 19 Dec 2004 04:15:31 +0300
Message-ID: <E1CfpfX-000ID6-00.trx-inbox-ru@f17.mail.ru>
Reply-To: Nebojsa Trpkovic <trx@inbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello.

I just got my new box and I'm testing it all day long :)
It's Socket754 AMD Athlon (Newcastle) 3000+. I've spotted that it can run stable (>=1h in prime95) at voltages much lover than it's by default. Default is:
1.500V @2.0GHz
1.100V @1.0GHz
And my tests show something like this (I haven't tested all frequencies yet):
1.525V @2.5GHz
1.400V @2.4GHz
1.325V @2.3GHz
1.250V @2.2GHz
1.200V @2.1GHz
1.150V @2.0GHz  <---
1.075V @1.9GHz 
... and so on.

My question is: 
Is there some way (PATCH) to specify manualy voltages for every FID my CPU can run? 
I don't care if it's command line argument while loading powernow-k8 module or it's some kind of hack within powernow-k8.c source, as long as it works :)

Thank you.
Regards,
Nebojsa

P.S. Don't worry, I wouldn't use exact "minimum" voltage, but for example 1.200 - 1.250V @2.0GHz

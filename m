From: aeriksson@fastmail.fm
Subject: Throttling vs. idling
Date: Sat, 11 Sep 2004 14:52:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040911125247.468CE3F04@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


Hi there,

I have this old laptop which can do 500 or 700 MHz. Unfortunately its 
acpi stuff is broken so it gets overheated and powers off under heavy 
& log compiles. However, I can access and use the throttling 
manually...

Now the question. Suppose I want to leave it on with light load 
(fetchmail every 5 mins). Would forcing throttling make it colder/
consume less power than would the normal idle loop? Normally I run it 
om apm mode to avoid the power offs, se I'm really comparing 

1) idle loop on apm mode, with 500MHz, and
2) idle loop on acpi, heavily throttled, with 500MHz.

Would 2 be a win?

/Anders

From: Wouter Verhelst <wouter@grep.be>
Subject: p4-clockmod doesn't seem to allow the highest possible speed
Date: Fri, 9 Jan 2004 19:18:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040109181851.GA1393@grep.be>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

I can't seem to get my processor to run at full speed when using the
p4-clockmod driver:

root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_governor 
userspace
root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_max_freq 
2193205
root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# echo 2193205 > scaling_setspeed 
root@worldmusic:/sys/devices/system/cpu/cpu0/cpufreq# cat scaling_setspeed 
1925000

What am I missing?

-- 
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.

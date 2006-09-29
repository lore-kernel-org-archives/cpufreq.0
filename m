From: Marco cusmai <cusmai@gmail.com>
Subject: speedstep-ich issue
Date: Fri, 29 Sep 2006 11:11:48 +0000
Message-ID: <200609291111.48598.cusmai@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Upgrading kernel form version 2.6.17.2 to 2.6.18 the cpufreq system makes 
  strange things.. looking at dmesg (with debugging enabled for cpufreq) it 
  seems that after a while the system recognizes only one step of frequency 
  (the slowest) .. The CPU is a P3 that can change the frequency from 730 MHz 
  to 1.1 GHz, using the speedstep-ich driver. Tell me if you need more 
  informations..

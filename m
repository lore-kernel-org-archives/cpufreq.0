From: Dominik Brodowski <linux@brodo.de>
Subject: speedstep-smi woes
Date: Tue, 18 Nov 2003 19:20:46 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031118182046.GA5950@brodo.de>
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

Under heavy load speedstep-smi generates "cpufreq: change failed" messages
at least on two systems, one of them my own. I've tried to evaluate how to
avoid these failures:

- wbinvd() has no positive effect
- disabling bus master arbitration (io-port 0x22 on 440bx) has no positive effect
- mdelay(250) immediately before the asm smi call has resulted in _zero_
  failures.

However, in most cases, even under heavy load, the speedstep-smi driver
_does_ achieve speedstep transitions. 

So, how to proceed?
a) Try to avoid these failures, even if the cost of all transitions is 250ms
   then? This practically disables dynamic frequency scaling for
   speedstep-smi.
b) Do the same as before: this means that sometimes the frequency isn't
   changed even though the user or the dynamic frequency scaling governor
   demands a higher frequency. Also, the "speedstep_init" step tends to fail
   sometimes.

	Dominik

From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [powernow-k6] using cpu_khz is OK?
Date: Tue, 23 Mar 2004 19:58:56 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040323185856.GE28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Cc: ducrot@poupinou.org

Hi,

powernow-k6 use cpu_khz as:

	busfreq = cpu_khz / max_multiplier;
in powernow_k6_init().

Well, IIRC if someone want to disable TSC, then cpu_khz is 0, or
I am wrong?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
